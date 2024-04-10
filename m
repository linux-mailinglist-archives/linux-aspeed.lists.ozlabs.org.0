Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4BC89FB0A
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Apr 2024 17:06:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lZjb2kWJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF5kp2S51z3dWP
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Apr 2024 01:06:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lZjb2kWJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF5kd078nz3cT2
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Apr 2024 01:06:15 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6eddff25e4eso218691b3a.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Apr 2024 08:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712761573; x=1713366373; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6vqlk/SomMLPQ4FVbSGs86RYi7S1wMHuvJyHDDLYAWQ=;
        b=lZjb2kWJ2R0RxIFPq9k7iMr1+d4dJkDj954MlUrCEBuUGkWrHZ2AkT6UiNG0qheACn
         RGpt3APDv228AY2kVk7Y5H5V9M1U909k1awvFE4eTRf8DvSsJaxj74RzTh/cNY1cUD80
         4GgMc0biNyPPX10xvHxCae3VsjINuLo+iX8FzY6gc/ETeqpcFuGcfbrA39y1eaXaWhDQ
         19phBQcXTKSJLSiKW7+upJMuRKyApb5MRURYwXxAg9kpIeTUrAOrL96AKWqV6y8Q1oAy
         QQdoDyZzIFJs95HwAr5/MtvqQjeCL1/6j3DmSD5+HraBJj56bJChHLqhbtJJcEJtq3SC
         PMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712761573; x=1713366373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6vqlk/SomMLPQ4FVbSGs86RYi7S1wMHuvJyHDDLYAWQ=;
        b=c6HoTJbmJZhXjFvG8Urq+B6c3Y2NvYG2wxbPfF8GK07v0F23vsuE7nh1lK+VdIQDJD
         ySpQe1Za8DpRF8yH3wnHKcoaAuOXqrujURbUhwBksbR869+Td4Qt0lN5ADQvyTaUPaBk
         iTGHqalh8HpXRE9NVM0Uw4ML0AjTGf7jmHePVWwZLrz+phiLj6Ql6YxfEqtjRqx0KkOl
         Ca3WoD/LxEeQZbyy/cyH4SESmcTn845c4OwgDfAI/8d4epjxQhrUIpE4XP6lwIMFGV75
         CJNDzb0/JAzbwLGsKU6M/neMt9kczGxxa2tWIprRx3ubw0nQ2T2nrApIn23TPXyZRyf4
         TosQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5t7xShsyojWrXoR4IcaBHYdkdRcoO+t9N5lTwEFtaAJ8Whjes0Utm3a6xpzSPgnJiwp/MMZ4TUnCORF1bPy49dhrrCkKVbq3kWQLVxA==
X-Gm-Message-State: AOJu0YwMe52EPjo5zlse9GHD+O1QYCgD5GjymLJt9W4dKMOmyzduBVIB
	oWMc68O+gNRJHauW4oR16g6JH+Lqqxy7BLQg7ewEPp7CWOxE67XP
X-Google-Smtp-Source: AGHT+IHb/BqnOK3lIbidy44kYmAAQQ3ACgYHA1ibS57uQ5YoZYYUn6Snx4hIfA1rV6t6o7efdCi8BQ==
X-Received: by 2002:a05:6a00:4b05:b0:6e6:5396:ce43 with SMTP id kq5-20020a056a004b0500b006e65396ce43mr3280605pfb.7.1712761573079;
        Wed, 10 Apr 2024 08:06:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h6-20020a654046000000b005dab535fac2sm8587425pgp.90.2024.04.10.08.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:06:12 -0700 (PDT)
Date: Wed, 10 Apr 2024 08:06:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tach) Convert to platform remove
 callback returning void
Message-ID: <1bc1f772-1576-4496-af4d-5123869838bf@roeck-us.net>
References: <20240409085552.19868-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409085552.19868-2-u.kleine-koenig@pengutronix.de>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org, kernel@pengutronix.de, Andrew Jeffery <andrew@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Apr 09, 2024 at 10:55:53AM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Applied.

Thanks,
Guenter
