Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B37A94167B3
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Sep 2021 23:49:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFphX40Yfz2ywM
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Sep 2021 07:49:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V3EyYY2z;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=V3EyYY2z; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFphP4KpKz2yHj
 for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Sep 2021 07:48:51 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id t10so31842907lfd.8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Sep 2021 14:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7FkpkRmKHqmPvFFREorMPwFdCCRcl6RFgYu4s9yiDfM=;
 b=V3EyYY2zZCCc3qurGlNx4ZlXLarvbqI9nr5hfYuyzB4wEmeUbF40YeZ3zAtxzDXEcK
 +t5/DnvFsnyMuYCa0KlgKwbFNuhL50Gpr8mdzijTcgutDXFE8abM1gVoeNcMkWT6A7M+
 zR3JSdoEhJTF6qk/WRbDbkWp2sivoJ0Vg/y2RUPkzfSl45P12ZAAvJ+sqOxFGNsL0AYo
 Krfq3aM1bvkTXIgCS4kQp0fC1yJ80UuOvRa2DRcDQcI/4cin9bTM3aaX/4jS+vY/3xcd
 FASXGIMHKWi8CBviYumU8po1T4UYtss2mOxNyBo69a20/Ue2KN/RAyTlIpJqolLOWZfK
 Q6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7FkpkRmKHqmPvFFREorMPwFdCCRcl6RFgYu4s9yiDfM=;
 b=B6EaumNBUPGv3FDCBcm5rtuM8M0++bm5yIoSXf2O807CrbxU/zM3+kyORJHQXb7KwR
 Ypt9cwnKpFQEvi54wEjLB77XVhuCpQ46ZSvFgpe3wPWisZBPP3XyycdfaS89fYzYkNdR
 oqim3EgpKXT5gjesy3wVBAf9eVEHUIZ56mcIUUT2L8adMKg1XX1pi2hnTfTFXbPmbIsX
 uIKhGo9vuEp4yVPy3hw9O8gpdz+RMVhGd0f6E02UPvzyCYJygcqJPMtEmpvHO2spiUlT
 ZWpSOOKz/pgZNJqVjbrwxxD/0OuN2FnKv+9CutadQv6GwfY0X7rqh+8ReXslhBIy076z
 tUhQ==
X-Gm-Message-State: AOAM530j72ZGMm5C7MLRxoo3SQ3AN+11kn2wZrWMsTmUSmG9Nv38tIgj
 f4M1V9vRkNA8jaoMG2go2X6p0ZBh5cuBwwZe1iYOSg==
X-Google-Smtp-Source: ABdhPJzRJ6lk2udBuzr9FrKwJZvK0C0NBFG8pHIWz3jIt1r/+I+/7dijGUv6MSez/cEvzFz71CddyZXKEEOMFuxPPL0=
X-Received: by 2002:a05:651c:4d2:: with SMTP id
 e18mr7656983lji.432.1632433723807; 
 Thu, 23 Sep 2021 14:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210921043936.468001-1-andrew@aj.id.au>
In-Reply-To: <20210921043936.468001-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Sep 2021 23:48:33 +0200
Message-ID: <CACRpkdYxNKXuL7w0BhAig3Hr8oHP2+Eqn94ABdaX4mxfxLy+=g@mail.gmail.com>
Subject: Re: [PATCH 0/2] leds: pca955x: Expose GPIOs for all pins
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Pavel Machek <pavel@ucw.cz>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Sep 21, 2021 at 6:39 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> 1. Contains no (ab)use of pinctrl
> 2. Always exposes all pins as GPIOs
> 3. Internally tracks the active pins

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
