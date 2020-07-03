Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28284214178
	for <lists+linux-aspeed@lfdr.de>; Sat,  4 Jul 2020 00:18:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49z8VL43S2zDrL2
	for <lists+linux-aspeed@lfdr.de>; Sat,  4 Jul 2020 08:18:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M/toDlrR; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49z8V81h57zDrJP
 for <linux-aspeed@lists.ozlabs.org>; Sat,  4 Jul 2020 08:17:49 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id cm21so5018637pjb.3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 03 Jul 2020 15:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sejNlP1ktqM/yqhWQBlfvEYEbrTSoZNaZ4fFsOcMXyo=;
 b=M/toDlrRcsBGClLXYYdtDWkvG3zMdTI3iAiO+yGwHaD7RuH8ssfG3JkLAjRNJ3GOgL
 emfRB5ok5rhARi30EPkLIJcne0S6+vyf89L+daajIxm+3jV32o1nm7IMWZ/2BXs17A+p
 ppSQXeUl+n57RSdqkEiPjuzk+ER8PF5bE8YfGaknJwHPyseEYDYisKCkHmRlQDZOnsGL
 8K8+SmPmDePzNISqaV0VptSe623mvWiiMHkXcNeuetOL1zOFL0SZe5EzlKSLuy1Dls1m
 hyKXBzq0ZbT6WFWRlmi0TVHcdRVB8zcnl2+L7kP7RXrRg8E8mti3kbXcTke3CVrClKei
 QYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=sejNlP1ktqM/yqhWQBlfvEYEbrTSoZNaZ4fFsOcMXyo=;
 b=M620OAVf7bm9vyKQ0JR75Y+ZserJonamttthoFAgSqrKpnQgqWm7CPpaWCm70Qxhfm
 Zb57gdazznKu1VvULfYmsXYIBEKee4TOLIZNoxPR21UU/QULllJAViAHjHPeE4P8eUqi
 VTtyspT0E1PkrkdPl04C8tPwXm6+f3jGlipt0ZTB0WNmq2wwcoOzrQPKAb4c2DAKqpTO
 0Fw9Q1r+o7nqKie14Kk+ij1FQYo0a3fYh1IZxOw6fB4no25jzQld16COaHMI5RfujlQ9
 0TptVp1sPadfYVMRunhnKqddw584ltRQoFcuinIE169F1HojDx97m053F/nGga0rDAy1
 TZzQ==
X-Gm-Message-State: AOAM533ij6ivyJO751uDbw8doaBejkux0UXlGtH4RMWK90Kx8HRnS4jr
 MLKcpUEvE1a6tzG8kt0v8fc=
X-Google-Smtp-Source: ABdhPJwd/f3TDfBVQj4VriwSYuAQ/lXojI58EaxlEBXVyYKB7TscoLWXYlzy0uHffDXMh89/mAefyQ==
X-Received: by 2002:a17:90a:718b:: with SMTP id
 i11mr37047631pjk.150.1593814665429; 
 Fri, 03 Jul 2020 15:17:45 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k2sm12728448pgm.11.2020.07.03.15.17.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 Jul 2020 15:17:45 -0700 (PDT)
Date: Fri, 3 Jul 2020 15:17:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Evgeny Novikov <novikov@ispras.ru>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) Avoid possible buffer overflow
Message-ID: <20200703221744.GA34644@roeck-us.net>
References: <20200703111518.9644-1-novikov@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703111518.9644-1-novikov@ispras.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-hwmon@vger.kernel.org, ldv-project@linuxtesting.org,
 Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jul 03, 2020 at 02:15:18PM +0300, Evgeny Novikov wrote:
> aspeed_create_fan() reads a pwm_port value using of_property_read_u32().
> If pwm_port will be more than ARRAY_SIZE(pwm_port_params), there will be
> a buffer overflow in
> aspeed_create_pwm_port()->aspeed_set_pwm_port_enable(). The patch fixes
> the potential buffer overflow.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 33fb54845bf6..3d8239fd66ed 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -851,6 +851,8 @@ static int aspeed_create_fan(struct device *dev,
>  	ret = of_property_read_u32(child, "reg", &pwm_port);
>  	if (ret)
>  		return ret;
> +	if (pwm_port >= ARRAY_SIZE(pwm_port_params))
> +		return -EINVAL;
>  	aspeed_create_pwm_port(priv, (u8)pwm_port);
>  
>  	ret = of_property_count_u8_elems(child, "cooling-levels");
