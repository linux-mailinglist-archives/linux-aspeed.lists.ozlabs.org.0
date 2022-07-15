Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 972F4576AC5
	for <lists+linux-aspeed@lfdr.de>; Sat, 16 Jul 2022 01:34:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ll73x4xtHz3c8W
	for <lists+linux-aspeed@lfdr.de>; Sat, 16 Jul 2022 09:34:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y8DVxR6s;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y8DVxR6s;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ll73p2g7bz3bZC
	for <linux-aspeed@lists.ozlabs.org>; Sat, 16 Jul 2022 09:34:12 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id 89-20020a17090a09e200b001ef7638e536so12875840pjo.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Jul 2022 16:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HVuLWaX/51pe6iPKpZjM/AG01K4knnM/A3m3uAhbAQs=;
        b=Y8DVxR6sOawVEjaHLCXc1dJoDIL28pl/tbsDsHTC7h8M9ZMK/Qunzt1Po92GRQnLFD
         6ojEkwkeczjtyYJaRbl8xWrbftge7ceHpByaXgFxCAxk6Sjx3upElB7cJR/rUrxf9hxX
         ciMkiXbjnNhK2zMD21wKE+x3C5yqFcvY4UR8CLlzfeHCt7qV427MbwY07hEUr31H31P1
         6s4Z96mQme4sH+7IywQ87UHRW44iZFAfEFakEmCFayGok9AfaFIQw3qoJYJfO3nWhufc
         JUWcqoJqTR/7wsz89CIAMJR49+XZ6FihlU31Z7jsH931f1cgeHt8M2Su1/xGuCLXrgZF
         c1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=HVuLWaX/51pe6iPKpZjM/AG01K4knnM/A3m3uAhbAQs=;
        b=uvO+vHeI+p6dP1gfiuVI9tw9f8nmyMZ4Nc+Ja7iUhiKJoDuLrYVdDD4qDyijZKmz8H
         SIJ6/RjI2ItC0/B7pqAUYGnp5TkVGqsHexxhCsTH4iBGKwZKr+xRHTOlhop+aMh+q/VU
         8Uu/rO+E4lPzFYJo2og5GKnDHrM3cE5rPiUn6X6mKQPzP+PEf35nfWU4Qd3t6/Nuhucm
         C0jkucYOhqG7V7VVE2Mc0oILVvaOjd/J/QNoQeAL03sEpV0S2HTjO4TwJow9vbFQ3n0g
         EVXz2oRQkzEJj7Oltp2XhEjCULh8bMiwZokuGYhw5xlu7kKA0snkBcmuRnwhSiPu9kjR
         IhWg==
X-Gm-Message-State: AJIora+IFRFef1+k8qC4xWIOWQPKdAoc/n19E/SNYfYwmzq8ubigsdbo
	qWuMZIfVBT4FiTKT1B+cnf8=
X-Google-Smtp-Source: AGRyM1uM81+cKbKT3WGocUxAy5d1sDgAAMq6j/VwKs19GHZuTtzSuJ2OhHXu8WyZAUMGVKKTwS1R+w==
X-Received: by 2002:a17:902:d543:b0:16c:3150:9ba1 with SMTP id z3-20020a170902d54300b0016c31509ba1mr16469556plf.13.1657928050099;
        Fri, 15 Jul 2022 16:34:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t2-20020a170902e84200b0016c2da4e73fsm4170878plg.106.2022.07.15.16.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 16:34:09 -0700 (PDT)
Date: Fri, 15 Jul 2022 16:34:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Fertser <fercerpav@gmail.com>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) increase fan tach period
 (again)
Message-ID: <20220715233408.GA2181024@roeck-us.net>
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

Patrick - any feedback ? Would it be possible to test this change with
Quanta-q71l ? Or do you envision no problems ?

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
