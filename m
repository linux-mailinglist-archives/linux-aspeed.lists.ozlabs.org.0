Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D206875664
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Mar 2024 19:52:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jBsekZ98;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrJLl0MpSz3vb6
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Mar 2024 05:51:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jBsekZ98;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrJLd3fl0z3c2F
	for <linux-aspeed@lists.ozlabs.org>; Fri,  8 Mar 2024 05:51:53 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e63e9abf6aso25660b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 07 Mar 2024 10:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709837510; x=1710442310; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUyNKrc+lz+/7kEV9cViNqymoVTf2ZJi7Os2/FxH13U=;
        b=jBsekZ98IX4hQia5ZZW0ZKaO/lSNJOrw8zhijuHNAR7eAwtD/noWR+XhGO/MEtIEPS
         n4I5MxGQjsyAjcaPwx5sbQIArT6p7I/MjymATAFRBvHdeLcTSH4U8xJCpYjqPd9rJs6H
         rRxgtf1UEoH3dzhDwGZoc8TlWxDMbUUh9/taBBt2sKTr+BIInNSLmLzLSjVXFj3BIIud
         sr7b3cL2pMe/ZMiTn4+/M2ewrBV0Rl6UsDc02ZTU+KZ/lO1llMOpCG8Ny8IlQdhPQdJe
         +zL/eDYYdiHlcT2eoxA2KYSm7I0xQDQFpFH8phGQn5/+Mn3h13KmsTk8au1+Ad1Xyaw3
         hwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709837510; x=1710442310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUyNKrc+lz+/7kEV9cViNqymoVTf2ZJi7Os2/FxH13U=;
        b=JsbcCHZ2zqFDl3xj5kFVdhq/SVbVZI1JgtpAoA4HKoiKgs2NCjfL6R9UuLY73m//PA
         03OeppJB7JyBpp2IZ0D+iC8MRQ17iqpEu2nOTYd7eCsc8vEcAKeYhZF9N1Dy37h4US31
         LCIbZ0dgkNDcNUHpZRAdiXZfJB/sGR7ClFRLkSFFAvvol33vsuQ+IEzOX2p8rkhrQAW/
         n0PddlnFIFdFdmVZVo4lfg88wy2tvX5Pzechynx8u/fPpsS+u72GBZ/ADRvNpBtkO//9
         itF9TleSHeQ+3loMKzV+EQuFurAAg6g5vJMLKAb+AM1zkIbYy6ThDFIQbIRJeg9YeLwC
         losw==
X-Forwarded-Encrypted: i=1; AJvYcCUAQwB8Uktiot88Ln8wllcEusuvliSk3qRuYJ/94k1PAqI0vEiIrbj91V2FSXVWYOhAZoYlnzgZif/0h8DblNLchJu9naRLvWB6iPyVjA==
X-Gm-Message-State: AOJu0YxUserSnvhJLNvlkitC/XJkfUNSmAtqWtKw32Oj6ihxti1zBKRq
	Q3hvoGvfUOU4FbxJDjUtI3wOD+MsWkjcvlYKsQ5+1/9YYm8gc+YY
X-Google-Smtp-Source: AGHT+IEvg54j22LNv7F28r4VAgw0h+HzFUEmPHt76C0lDF58wlsi+HlDriKXzvLhKX2N54XOqkpkDg==
X-Received: by 2002:a05:6a00:39a6:b0:6e5:8fad:6f75 with SMTP id fi38-20020a056a0039a600b006e58fad6f75mr19634198pfb.19.1709837510258;
        Thu, 07 Mar 2024 10:51:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l6-20020a635706000000b005dc98d9114bsm13225403pgb.43.2024.03.07.10.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 10:51:49 -0800 (PST)
Date: Thu, 7 Mar 2024 10:51:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v14 3/3] hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED
 g6 PWM/Fan tach
Message-ID: <771b185f-98ee-475d-8075-86399b3dfe09@roeck-us.net>
References: <20240221104025.1306227-1-billy_tsai@aspeedtech.com>
 <20240221104025.1306227-4-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221104025.1306227-4-billy_tsai@aspeedtech.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, corbet@lwn.net, BMC-SW@aspeedtech.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, naresh.solanki@9elements.com, patrick@stwcx.xyz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Feb 21, 2024 at 06:40:25PM +0800, Billy Tsai wrote:
> The driver support two functions: PWM and Tachometer. The PWM feature can
> handle up to 16 output ports, while the Tachometer can monitor to up to 16
> input ports as well. This driver implements them by exposing two kernel
> subsystems: PWM and HWMON. The PWM subsystem can be utilized alongside
> existing drivers for controlling elements such as fans (pwm-fan.c),
> beepers (pwm-beeper.c) and so on. Through the HWMON subsystem, the driver
> provides sysfs interfaces for fan.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Applied to hwmon-next. There was an outstanding suggestion:

> > +static int aspeed_pwm_tach_remove(struct platform_device *pdev)
> > +{
> > +	struct aspeed_pwm_tach_data *priv = platform_get_drvdata(pdev);
> > +
> > +	reset_control_assert(priv->reset);
> 
> This is already done by aspeed_pwm_tach_reset_assert(), looks like
> aspeed_pwm_tach_remove() can be removed. With that, priv->reset can
> become a local variable in aspeed_pwm_tach_probe().

I'll be happy to apply a follow-up patch making this change.

Thanks,
Guenter
