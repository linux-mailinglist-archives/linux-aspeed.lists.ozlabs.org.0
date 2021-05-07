Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9B5375E31
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 May 2021 03:06:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbshl32fmz2yWw
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 May 2021 11:06:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.173;
 helo=mail-oi1-f173.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbshc5mnfz2yR6
 for <linux-aspeed@lists.ozlabs.org>; Fri,  7 May 2021 11:06:06 +1000 (AEST)
Received: by mail-oi1-f173.google.com with SMTP id b25so2031534oic.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 06 May 2021 18:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qNz9umZ4AwFT7+0+9QX1oMvRnHAxwDwQzkL23KUHYkY=;
 b=gReszdgutzZ0XAAHjT2XS52ANHmnn4/i0I47yzs96XImJ+KI3IIhaPy5nj8tzhfxhP
 lZN5SikjwGVi32RmP05Yc9vwExKWE3JmLkQyn3ndLWFC8KQ9zAicclKhzuZ+2Jw3SNlp
 LsR3Ob/J9Pf1XUGRKlEPvsjI3DP8BycG5nw0z0sYGgN80AgZVmwCE3hjra9kfrdtGWAC
 +HqDsCjmKfJvzqEBO/Y3u+qgO82Z+kxuFB371G0xbR8Fu1TODHs1dbCpwP89NKgtuiCJ
 fYqR0EDmA7a5iWHe0er5nPsrw62yLuGbyptjEKDVXmOu1/Eo713+eYdvKXvQa2Lrdaca
 F3tw==
X-Gm-Message-State: AOAM530NKHMWU8EoVOhq/wzoyLtvDixDcCOf8ZYfJcj8xD0miKhUZmci
 UJFLa8e3k+QhLkJt0F9a9Q==
X-Google-Smtp-Source: ABdhPJx5iGfusIGqyuo8OAS7ETonBnhCqs0VbRUpxTjFfadb0udpobnAeLQ5u5krefupdXNR/CJgMQ==
X-Received: by 2002:a54:410a:: with SMTP id l10mr12692079oic.15.1620349563250; 
 Thu, 06 May 2021 18:06:03 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e20sm834132oot.11.2021.05.06.18.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 18:06:02 -0700 (PDT)
Received: (nullmailer pid 1115466 invoked by uid 1000);
 Fri, 07 May 2021 01:06:01 -0000
Date: Thu, 6 May 2021 20:06:01 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v3 0/2] Support pwm driver for aspeed ast26xx
Message-ID: <20210507010601.GA1110621@robh.at.kernel.org>
References: <20210506061050.8001-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210506061050.8001-1-billy_tsai@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-pwm@vger.kernel.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, p.zabel@pengutronix.de,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, May 06, 2021 at 02:10:48PM +0800, Billy Tsai wrote:
> The legacy driver of aspeed pwm is binding with tach controller and it
> doesn't follow the pwm framworks usage. In addition, the pwm register
> usage of the 6th generation of ast26xx has drastic change. So these
> patch serials add the new aspeed pwm driver to fix up the problem above.
> 
> Changes since v2:
> - Remove the tach node, #address-cells and #size-cells from pwm-tach.yaml

So you don't need tach functions, they don't need it to be described in 
DT any more, or you plan to add them back later? The last one is not 
acceptable.

> - Add clocks and reset properties to pwm-tach.yaml
> - Kconfig/Makfile sorted alphabetically
> - pwm-aspeed-g6.c suggested by Uwe Kleine-König
>   - Add more hardware descriptions at top of the driver.
>   - Remove unused api request and free
>   - Move the initialize settings of all pwm channel to probe.
>   - Change the method of getting the approximate period.
>   - Read the hardware register values to fill the state for .get_state()
> 
> Changes since v1:
> - Fix the dt_binding_check fail suggested by Rob Herring
> - Add depends to PWM_ASPEED_G6 configure suggested by Uwe Kleine-Konig
> - pwm-aspeed-g6.c suggested by Uwe Kleine-König
>   - Fix license header
>   - Use bitfiled.h macro to define register fields
>   - Implement .remove device function
>   - Implement .get_state pwm api
> 
> 
> Billy Tsai (2):
>   dt-bindings: Add bindings for aspeed pwm-tach and pwm.
>   pwm: Add Aspeed ast2600 PWM support
> 
>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml |  55 +++
>  .../bindings/pwm/aspeed,ast2600-pwm.yaml      |  41 ++
>  drivers/pwm/Kconfig                           |   8 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-aspeed-g6.c                   | 368 ++++++++++++++++++
>  5 files changed, 473 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
>  create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
>  create mode 100644 drivers/pwm/pwm-aspeed-g6.c
> 
> -- 
> 2.25.1
> 
