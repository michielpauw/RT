# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nmanzini <nmanzini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/12/06 17:41:17 by mpauw             #+#    #+#              #
#    Updated: 2018/06/28 10:49:57 by nmanzini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = RT
INCLUDES = rt.h keys.h mlx_constants.h
SRCS = 	rt.c\
		set_scene.c\
		set_object.c\
		set_object_2.c\
		set_camera.c\
		set_composite.c\
		set_render.c\
		set_mesh.c\
		set_menu.c\
		set_object_menu.c\
		set_camera_menu.c\
		set_light_menu.c\
		set_strings.c\
		set_material.c\
		set_pattern.c\
		set_light.c\
		set_point_list.c\
		set_finish.c\
		set_fixed_values.c\
		set_fixed_values_2.c\
		set_t_values.c\
		set_t_values_2.c\
		get_event.c\
		set_light_per_pixel.c\
		set_light_per_pixel_2.c\
		get_intensity.c\
		get_t_value.c\
		get_t_value_2.c\
		get_object_material.c\
		tools_parse.c\
		tools_vector.c\
		tools_color.c\
		tools_rotate.c\
		tools_anti_a.c\
		tools_grain.c\
		tools_limits.c\
		tools_thread.c\
		event_key.c\
		control_light.c\
		control_light_2.c\
		control_camera.c\
		polka_dot_it.c\
		stripe_it.c\
		refraction.c\
		get_mesh_obj.c\
		filter_it.c

OBJ = $(SRCS:%.c=%.o)
LFTDIR = libft/
#
# Use other $LMLXDIR by (un)commenting the following two lines
# if the project does not compile.
#
LMLXDIR = minilibx_macos/
LIBFT = libft.a
LIBMLX = libmlx.a
FT = ft
MLX = mlx
MAKE = make
FLAGS = -Wall -Wextra -Werror
FRAMEWORK = -framework OpenGL -framework AppKit

all : $(NAME)

$(NAME): $(OBJ) $(LFTDIR)$(LIBFT) $(LMLXDIR)$(LIBMLX)
	-@gcc $(FLAGS) -o $(NAME) -ggdb $(OBJ) -I$(LFTDIR) -L$(LFTDIR) -l$(FT) \
	 -I$(LMLXDIR) -L$(LMLXDIR) -l$(MLX) \
	 $(FRAMEWORK)
	-@echo "RT Ready"

%.o: %.c $(INCLUDES)
	-@gcc $(FLAGS) -I$(LFTDIR) -I$(LMLXDIR) -c $(SRCS)

$(LFTDIR)$(LIBFT):
	$(MAKE) -C $(LFTDIR) $(LIBFT)

$(LMLXDIR)$(LIBMLX):
	$(MAKE) -C $(LMLXDIR) $(LIBMLX)

clean:
	-@/bin/rm -f $(OBJ)
	-@$(MAKE) -C $(LFTDIR) clean
	-@$(MAKE) -C $(LMLXDIR) clean

fclean: clean
	-@/bin/rm -f $(NAME)
	-@$(MAKE) -C $(LFTDIR) fclean

re: fclean all

.PHONY: all clean flcean re
