Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC22E3B2F4B
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Jun 2021 14:44:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9fwQ5L5Lz309V
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Jun 2021 22:44:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TUytgdOp;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32a;
 helo=mail-ot1-x32a.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TUytgdOp; dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9fwL6zJGz306m
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Jun 2021 22:44:33 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id
 d21-20020a9d72d50000b02904604cda7e66so3632917otk.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Jun 2021 05:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q3gvZmypEjLXLqsFmPmNg0fnsAU683BrMuDR/uus3S8=;
 b=TUytgdOpb5Dh7U9LBK+OVwUmgXNPe/LpMGCGsLMVUVefURAC/FGHmidrYT3x56hMlv
 kUOiDdl+iw+9OiLKEue02u+DwW//WcvApLPcvEzBhZ+N3oLYkX7gMEhRV/yav4NvgsiN
 K0EFn3fWEKCQNBwlCYzzat8iK7cBbEmS0rVBmSoGoxTonFxC3kLa+PkbWsC5ITeCqWVT
 MjDmZrxd3X0tvMk27+Chkb/jQ9HrHLP0qK1elHqVuOPQvN5JvKvXuZ3BNh1bcF4LYLxe
 ZoC1u3wgfRs6SEmzFrG0ZEn07yYcQvcpMbGIuA7oK+x20vdgCwgWurHLuMWc9GlNgzPJ
 HKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=Q3gvZmypEjLXLqsFmPmNg0fnsAU683BrMuDR/uus3S8=;
 b=HSCUv4ExbVPpHW3vxcf/Z60ghxc+Rq2VSut3sXUxBK6jmXrpXFNL3pJMJLVuJMILyz
 QhIi/+h9IafjzBEnh25Cq+rv6/BWRcW5BaAOEyfQcP8tLKF8s8IPkOmypbaE6xyyQB+o
 O+wtgkiIwMV9FL349rm6zmVHpoXDDuv38ZMeJ8ohrJdqEaVoWZ/ozR3zx/Jzj6iBcpol
 pulLPXFqg9knHZ7iNQnl0jx1ZXplCSozh9Ndgb9B60TSzFki3haoexIjeE6SfTEuOveu
 I+R4q+PdqyEGJD23xDxJyUZJGzoCsJ6qqTe/KFEy+Hwxw51r8B1Ls0T3PAyp7XX6rC6y
 1lBg==
X-Gm-Message-State: AOAM532EcoHREuN8cEP4DjWUd5REFQPvYwzqr14BtHP3uqN09JGVAlRA
 Kb5SH1k0Myvuxdm35wIsNBU=
X-Google-Smtp-Source: ABdhPJyGU8PRH2pP3pbdqSGcc0Y7/MlzY7Ggy4CwdK//7tZYzApvAnUs/5/Br9kykr9JEZOqHdR5hA==
X-Received: by 2002:a05:6830:154b:: with SMTP id
 l11mr4598072otp.66.1624538669960; 
 Thu, 24 Jun 2021 05:44:29 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h27sm642857ote.79.2021.06.24.05.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 05:44:29 -0700 (PDT)
Date: Thu, 24 Jun 2021 05:44:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) Using falling edge.
Message-ID: <20210624124428.GB1670703@roeck-us.net>
References: <20210624035821.25375-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624035821.25375-1-billy_tsai@aspeedtech.com>
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
Cc: linux-hwmon@vger.kernel.org, BMC-SW@aspeedtech.com, jdelvare@suse.com,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jun 24, 2021 at 11:58:21AM +0800, Billy Tsai wrote:
> The tach shouldn't use both edges to measure. When the tach input
> duty cycle isn't 50% the return value will inaccurate.
> 
A tachometer doesn't have a duty cycle. A pwm has a duty cycle, but that
is completely independent of the pwm duty cycle used to set the fan speed.
So this patch does not really make sense with the above explanation.

The impact of this patch is likely that the reported fan speed is reduced
by 50%. It may well be that the driver currently reports twice the real fan
speed. I have no idea if that is the case, but if it is it should not be
conditional. The description above states "when the tach input cycle isn't
50%", suggesting that this is conditional on some other configuration.
I don't know what that might be either.

So, sorry, I can't accept this patch without a more detailed and accurate
description and explanation why it is needed.

> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 3d8239fd66ed..0a70a0e22acf 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -158,7 +158,7 @@
>   * 10: both
>   * 11: reserved.
>   */
> -#define M_TACH_MODE 0x02 /* 10b */
> +#define M_TACH_MODE 0x00 /* 10b */

That comment is now wrong.

Guenter

>  #define M_TACH_UNIT 0x0210
>  #define INIT_FAN_CTRL 0xFF
>  
> -- 
> 2.25.1
> 
