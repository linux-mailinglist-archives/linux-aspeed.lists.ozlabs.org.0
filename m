Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB1594C70E
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Aug 2024 00:40:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1DoEXWjZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wg27Y1zd3z2yGf
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Aug 2024 08:40:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1DoEXWjZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=khilman@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wg27P5P1xz2yGT
	for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Aug 2024 08:40:31 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fc4fcbb131so11590435ad.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Aug 2024 15:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723156829; x=1723761629; darn=lists.ozlabs.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnFFKslAyQCvTlzcAGgFXS35aWJRluBhjxEK1S5MBPE=;
        b=1DoEXWjZWJDHyWZTQa8Cf2sVFIGX+bua6seeuXnfW8xU8Nr3SQIxBUOFVJcPaChOm2
         VcR87rLo/fZJD1DpqktC7g44YTmahaiL6EvBkfyoznhWXJCPYpdqB1xqYDIz1OT+HyaH
         W+B8HMHiHRc8DLECY6d7QAWobzBQS7e2WHfo0OEv8d9MHV0hmWm6ssWzFGedPsdMcXH4
         Uf/6Fqmvh5ABq+vAPEV0DiIUl81V7tmxsTjJLieEO9Q2nUt/E5kOBPX+bRKhd8aGWqKd
         ofcEBnXrDkCcxM/+KkYIH9lX2zydKAwmSzaKGkc/42V2D9er4pXO5x1uAY2G9PSAWHiN
         1S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723156829; x=1723761629;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vnFFKslAyQCvTlzcAGgFXS35aWJRluBhjxEK1S5MBPE=;
        b=OYunrgssQyI+tbKds7LeEDek2PFbUCjjRCKz1RjBCjZ5/oxme/jD6oX1G+k4UfwKUr
         HSQSQrgataCJ5pBL0D+CKgwsbl9GsVxFGxtdXEbjN6M57y7ehSTQMFv3BnUAAlke+w7V
         hLv/ZrOcXcedTKT8g3TCZJbVeuKYGMutTktQ5+nYoMyty3VL3PQKG9uqGPEdVQfKjn3w
         KTShS+c7SednYu3ZiiyNPPGpnLpMDAlnXkXAELtGKyqu4V+7Lte5m09KvZXiHj4Ku/2I
         +Ihg/fw0LgjBFbE7AVN0ux1vnTOFbxY7WHMFZ+K4w9nYlpmWgOGPQBAhAPFMHexF1deR
         oVyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKt6VQ51JOFgFh+H+QPG/JhFpWRDQr91y2uhzVHndSWykBKJ9Azhz76gdQ9VPQsJUzr0I9hz9aqAyNZKix7aO3KluUTyqJBbY36alScg==
X-Gm-Message-State: AOJu0Yx2v3R9A9TSyhQ8w7i7wDIwb5qO0jVh5atkNbiQsuQreF45nUe3
	X0Ev0Sj9LV7HcNRlTUTeVBsw3GQmm1GQCHlIPTqJKn7tnTk/mR2ty0CEFLYvuaA=
X-Google-Smtp-Source: AGHT+IFuozGVpD2S8JcbyZGe128XhqnFMQbDl0tXLzyrxRy3snyF4waOTyuxeRGS6PqrGLYA3KLmIg==
X-Received: by 2002:a17:903:228c:b0:1ff:4d4f:d819 with SMTP id d9443c01a7336-200952633e7mr47633515ad.34.1723156829035;
        Thu, 08 Aug 2024 15:40:29 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200668fc398sm85768725ad.207.2024.08.08.15.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 15:40:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, soc@kernel.org, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Dinh Nguyen <dinguyen@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Mark Jackson <mpfj@newflow.co.uk>, Tony Lindgren
 <tony@atomide.com>, Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH] ARM: dts: Fix undocumented LM75 compatible nodes
In-Reply-To: <20240808164941.1407327-1-robh@kernel.org>
References: <20240808164941.1407327-1-robh@kernel.org>
Date: Thu, 08 Aug 2024 15:40:27 -0700
Message-ID: <7hcymir63o.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

"Rob Herring (Arm)" <robh@kernel.org> writes:

> "lm75" without any vendor is undocumented. It works with the Linux
> kernel since the I2C subsystem will do matches of the compatible string
> without a vendor prefix to the i2c_device_id and/or driver name.
>
> Mostly replace "lm75" with "national,lm75" as that's the original part
> vendor and the compatible which matches what "lm75" matched with. In a
> couple of cases the node name or compatible gives a clue to the actual
> part and vendor and a more specific compatible can be used. In these
> cases, it does change the variant the kernel picks.
>
> "nct75" is an OnSemi part which is compatible with TI TMP75C based on
> a comparison of the OnSemi NCT75 datasheet and configuration the Linux
> driver uses. Adding an OnSemi compatible would be an ABI change.
>
> "nxp,lm75" is most likely an NXP part. NXP makes a LM75A and LM75B.
> Both are 11-bit resolution and 100ms sample time, so "national,lm75b" is
> the closest match.
>
> While we're here, fix the node names to use the generic name
> "temperature-sensor".
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> SoC maintainers, Please take this directly.

[...]

>  arch/arm/boot/dts/ti/omap/am335x-nano.dts     |  2 +-

For this one...

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
