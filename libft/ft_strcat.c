/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strcat.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mpauw <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/07 15:14:23 by mpauw             #+#    #+#             */
/*   Updated: 2018/04/10 10:40:46 by mpauw            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strcat(char *s1, const char *s2)
{
	char	*to_return;

	to_return = s1;
	while (*s1)
		s1++;
	while (*s2)
	{
		*s1 = *(s2++);
		s1++;
	}
	*s1 = 0;
	return (to_return);
}
