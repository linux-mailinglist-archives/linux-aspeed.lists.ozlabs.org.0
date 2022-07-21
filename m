Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A44F657C2F6
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jul 2022 05:50:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpJVb42x7z3c46
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jul 2022 13:49:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ASmnKm3T;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ASmnKm3T;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpJVV1swxz2yQj
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jul 2022 13:49:53 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id g12so623699pfb.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Jul 2022 20:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=IhGndbcR3r1FDnhh3JNd9RckhpCoqpWOwPcG1TQZ3SY=;
        b=ASmnKm3TxcgaKpbrSK1DdfQza5i2zhoec+W2MZa/oEmT7NEJjMv5+zox8VZv19ocwh
         bMGiC1ENawk1x3aKc0pvKC86ERo1oiKo7//5F3qaoL/KBBXPeT+hDDTEbY9eiPSzrFWX
         LEZRpK9ncIUKcBu1RYXeswpKHZlHz2SG1PJwKOsKkNXEc/rE5AQ1NwasUbWt+IqPlSDe
         f5ueqqA+m2lZlLrw6eNw0X4iEX3ISYNW2bQ3FMYuYSdhjF851sKWFitT0z9U+3WLQa55
         8bPFMfow7d8ObPSYSKiYbEMrysp/Vkq25sGnyR49Rdr6vfQNatDWW6pAdqOJ9CyXXw1w
         VPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=IhGndbcR3r1FDnhh3JNd9RckhpCoqpWOwPcG1TQZ3SY=;
        b=qrdlTKofhOuJ/yWcM5O5RYXwPLx7BV5Ge8l601OzYDOD+SC/9w640MSR8fARpFYMPf
         e74q6+uukg7qOr+j/3cYQRF7qQ+Pu4GnQFp5/4TDgDnZalpeCPn3/VFBySQvMTSZ/pGd
         PnLoqVq+M6eZftrf4fO8ZDx9sc3u6NDDnD6DwTdF/IsO4mFT8hfNCPjIPyogvHwDxzFq
         MN5Ju7Ny+VzwZcjXSLo3SXWsHmZ+SUrpvCPl3EkKjjUZSDO6rbuMA8nTmRJtIi43c7BB
         W9ulnxBpShcUZsTAGxdgdtJgQpWRfqaSjafa65zq8GoUo5Hp3YdUfYQaU1xc4FrFGewz
         wevQ==
X-Gm-Message-State: AJIora9kPUAi/BBjYWFux59bUrUboyL7O7AQFu7544u7mGNOlOJouYu8
	6zoMkOpK/cb+qU0vprxZGN8=
X-Google-Smtp-Source: AGRyM1tMSWVSmGatmv43AyRP8GID+Ov9Iki8PppurPj99s0mjpw22LjyH13wodRtIj9/V9FJF7o57Q==
X-Received: by 2002:aa7:8811:0:b0:52a:b0a4:a324 with SMTP id c17-20020aa78811000000b0052ab0a4a324mr42543906pfo.63.1658375387861;
        Wed, 20 Jul 2022 20:49:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b18-20020a170903229200b0016be96e07d1sm361930plh.121.2022.07.20.20.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 20:49:47 -0700 (PDT)
Date: Wed, 20 Jul 2022 20:49:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Fertser <fercerpav@gmail.com>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) increase fan tach period
 (again)
Message-ID: <20220721034946.GA1644072@roeck-us.net>
References: <20220714142344.27071-1-fercerpav@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220714142344.27071-1-fercerpav@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org, Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jul 14, 2022 at 05:23:44PM +0300, Paul Fertser wrote:
> The old value allows measuring fan speeds down to about 970 RPM and
> gives timeout for anything less than that. It is problematic because it
> can also be used as an indicator for fan failure or absence.
> 
> Despite having read the relevant section of "ASPEED AST2500/AST2520 A2
> Datasheet – V1.7" multiple times I wasn't able to figure out what
> exactly "fan tach period" and "fan tach falling point of period" mean
> (both are set by the driver from the constant this patch is amending).
> 
> Experimentation with a Tioga Pass OCP board (AST2500 BMC) showed that
> value of 0x0108 gives time outs for speeds below 1500 RPM and the value
> offered by the patch is good for at least 750 RPM (the fans can't spin
> any slower so the lower bound is unknown). Measuring with the fans
> spinning takes about 30 ms, sometimes down to 18 ms, so about the same
> as with the previous value.
> 
> This constant was last changed in
> 762b1e88801357770889d013c5d20fe110d1f456.
> 
> Signed-off-by: Paul Fertser <fercerpav@gmail.com>

I did not get any further feedback, so:

Applied to linux-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 3cb88d6fbec0..d11f674e3dc3 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -159,7 +159,7 @@
>   * 11: reserved.
>   */
>  #define M_TACH_MODE 0x02 /* 10b */
> -#define M_TACH_UNIT 0x0210
> +#define M_TACH_UNIT 0x0420
>  #define INIT_FAN_CTRL 0xFF
>  
>  /* How long we sleep in us while waiting for an RPM result. */
