Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C44292234
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Oct 2020 07:33:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CF55h1ZV3zDqck
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Oct 2020 16:33:44 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D5m23CSA; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CF55W20RvzDqYh
 for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Oct 2020 16:33:34 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id ds1so4695323pjb.5
 for <linux-aspeed@lists.ozlabs.org>; Sun, 18 Oct 2020 22:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KFWrTk4/MZRsh73cemPCA+garm+vxmS38qR0bZiOZMU=;
 b=D5m23CSAnlxOO264W+obGZxOzdlnF5kbJtbqFPYGXT/1ng15hfHIkYILhDQXXsvy4j
 zL+zDNS/DuvNsPsob4Nm1eUo22ayfH+h3/i+USeUoR2pkGMl+tfUYgTc6Um04L+dicoe
 wPFdXJin4rGYOiJmznv8KWU++Lhsmp/dLJ/3BzqUke55Ao/p+yD1RSyew0dnUA/yGzB5
 F95ePr1i8cXh8XtkcRaxp09dMDGJUm90GGpWo+uN6XqNEmwI+Br94ux670UWfcGpVdBx
 oHWPjKSxhqOCkWM9Bac0XZCY34DZcoQ+KP8Iw/+OEShRMBnj8KbT9qXcofaVztOdhNR/
 2LeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KFWrTk4/MZRsh73cemPCA+garm+vxmS38qR0bZiOZMU=;
 b=bY3HpmdiHLWfub0Eof35YbrWBAn4UsF4676OULF2U9pfPlCGJT0StzAfsgNzOtakns
 6KeTTnNHNTxSUpoC6Do/MeeytnskxRHabhCpZ86YK2qAzS33YcALADUHeSzq1lAM7u6b
 jZcB0DUjOz94DXYApTovyzz6YQ62T0k5nHJ5FjY3bDomuazZ6zFF3ETVLPCiao6LMkOQ
 Awva7nuiymkOJmFBY8JMwT31RQ77vnvbGp2GTbbgeMWIKTItiXZzyBM/s1hoDH0gK16m
 dhR9Kcgq97lWAdriaAfFmNt0bopG/LC4BItovJ0gZ/YleuadBvGse6YBABe/yOh8YlDy
 T6JQ==
X-Gm-Message-State: AOAM5303JzdADVr0LHCzbuUhtIPdlXWMa+XTEwxN9YnTXyANCjOsWwTV
 JLg0JOY6sJjHZBx6M6cDsgI=
X-Google-Smtp-Source: ABdhPJxKgO51xEOj5gm51q6eAqM7pKz0IiBuhoU/oD9zmT7Jv0FsRD5MIHf9f2kMRzvcaon12XRAFQ==
X-Received: by 2002:a17:90a:f685:: with SMTP id
 cl5mr15761445pjb.210.1603085612528; 
 Sun, 18 Oct 2020 22:33:32 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id q6sm10759022pfn.10.2020.10.18.22.33.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 18 Oct 2020 22:33:31 -0700 (PDT)
Date: Sun, 18 Oct 2020 22:33:25 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH] gpio: aspeed: fix ast2600 bank properties
Message-ID: <20201019053324.GA4300@taoren-ubuntu-R90MNF91>
References: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Billy,

On Mon, Oct 19, 2020 at 12:50:26PM +0800, Billy Tsai wrote:
> GPIO_T is mapped to the most significant byte of input/output mask, and
> the byte in "output" mask should be 0 because GPIO_T is input only. All
> the other bits need to be 1 because GPIO_Q/R/S support both input and
> output modes.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

You may want to add "Fixes" tag if you take it as a bug fix? For
example:

Fixes: ab4a85534c3e ("gpio: aspeed: Add in ast2600 details to Aspeed driver")

> ---
>  drivers/gpio/gpio-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index d07bf2c3f136..f24754b3f6d1 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1114,6 +1114,7 @@ static const struct aspeed_gpio_config ast2500_config =
>  
>  static const struct aspeed_bank_props ast2600_bank_props[] = {
>  	/*     input	  output   */
> +	{4, 0xffffffff,  0x00ffffff}, /* Q/R/S/T */

Reviewed-by: Tao Ren <rentao.bupt@gmail.com>

>  	{5, 0xffffffff,  0xffffff00}, /* U/V/W/X */
>  	{6, 0x0000ffff,  0x0000ffff}, /* Y/Z */
>  	{ },
> -- 
> 2.17.1
> 

Cheers,

Tao
