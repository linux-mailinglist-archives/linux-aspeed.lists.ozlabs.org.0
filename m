Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 116DF61DAB6
	for <lists+linux-aspeed@lfdr.de>; Sat,  5 Nov 2022 15:02:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4K1s1p0Hz3cV8
	for <lists+linux-aspeed@lfdr.de>; Sun,  6 Nov 2022 01:02:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WZJGW3l1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WZJGW3l1;
	dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N4K1j4d0lz3c6t
	for <linux-aspeed@lists.ozlabs.org>; Sun,  6 Nov 2022 01:02:15 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id g10so7918327oif.10
        for <linux-aspeed@lists.ozlabs.org>; Sat, 05 Nov 2022 07:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWKQpWV4q18oUUAJI5y05A3Qk/YN9wzpbCG2obhLtyQ=;
        b=WZJGW3l1z10C+6EY2Vpl9D/BE2rvprjerZP/fVm6a0Lfz3ce47j6rdLjoeBrk9zwRf
         El2g06eggeoqBRt51CGxE8LjuJPD6nF1vLwBUE1Sr4qk0rglhlQb5+O9gkZ3NjMitZMH
         llF0MvXfOmHyhZrTQ1wAfiN/uSQ8ltVsQbD2LAVwQA0KoEDtXxG/gSH/GXDGzzs/1DzF
         GvCVUbfdpacxYILCrY9pLYW8WmQ+01h38IZmMBflXUGJsz0l0A8FqSJ6SSLZtcMO1VA0
         UbF/HZHSQxUv5WsLLHjHNFveTeI5ZrzXCK1n0ayNArjcOwVN+jcJqEe2OP6aXq0OiS/g
         cmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWKQpWV4q18oUUAJI5y05A3Qk/YN9wzpbCG2obhLtyQ=;
        b=N5KeiWyW1qAQPmGXVk69mMEiXw++BQjo6SZRh5zV355m5WDtOVSR35wOUZrsMSVOEC
         r2ET9M+pQpim/iRBdPqp2/Gw7h4hqKb/bmnCQVZNr0l3IRTFY5EXDu+YwamYrIL9WsKo
         FSLmdRHnMHIe7tvNOUUifcScp2c05QfozI3HV7m9wHQvDD0+runTKU42T4uB5NU9ZYKO
         zMg6absnBzlp778UUsLXzww4/FlmZvWGS6D1sbKigg1anTilsx7nVCvEcoi4x5Keob1T
         7HKP+WFcJpagm6MDMcXv/Hbqpbj978pewVx3KJ2l7hvhK6qWAWZjp2zLxwCCkvskOlRQ
         tmIg==
X-Gm-Message-State: ACrzQf0/QmlT4EdguYJR/wttkoKxgOJh8V3rInEUficDda3yWwzZT5Tv
	nJw4S98Lql6GvIeLbFQyhWU=
X-Google-Smtp-Source: AMsMyM5RaWy/k+dJcmwEl4cIbvyShI1ptqjzBjNZBPpR17CbK3PAkFdqE/NSjFMUMWq60Wb4tRpZbA==
X-Received: by 2002:a05:6808:2387:b0:354:e5a0:ec9d with SMTP id bp7-20020a056808238700b00354e5a0ec9dmr360773oib.202.1667656932512;
        Sat, 05 Nov 2022 07:02:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 3-20020a4ae1a3000000b0048fb9b6dd70sm666953ooy.0.2022.11.05.07.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 07:02:11 -0700 (PDT)
Date: Sat, 5 Nov 2022 07:02:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] watchdog: Include <linux/kstrtox.h> when appropriate
Message-ID: <20221105140209.GB1606271@roeck-us.net>
References: <08fd5512e569558231247515c04c8596a1d11004.1667646547.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08fd5512e569558231247515c04c8596a1d11004.1667646547.git.christophe.jaillet@wanadoo.fr>
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Nov 05, 2022 at 12:09:34PM +0100, Christophe JAILLET wrote:
> The kstrto<something>() functions have been moved from kernel.h to
> kstrtox.h.
> 
> So, in order to eventually remove <linux/kernel.h> from <linux/watchdog.h>,
> include the latter directly in the appropriate files.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/aspeed_wdt.c   | 1 +
>  drivers/watchdog/watchdog_dev.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 0cff2adfbfc9..10863d2ef924 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -8,6 +8,7 @@
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/kstrtox.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 55574ed42504..f31608f3e324 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -35,6 +35,7 @@
>  #include <linux/init.h>		/* For __init/__exit/... */
>  #include <linux/hrtimer.h>	/* For hrtimers */
>  #include <linux/kernel.h>	/* For printk/panic/... */
> +#include <linux/kstrtox.h>	/* For kstrto* */
>  #include <linux/kthread.h>	/* For kthread_work */
>  #include <linux/miscdevice.h>	/* For handling misc devices */
>  #include <linux/module.h>	/* For module stuff/... */
> -- 
> 2.34.1
> 
