Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A699578CB
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHR4fsfz30Wl
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DwgbAIrm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=shawn.gsc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TT1p70vh0z2xdR
	for <linux-aspeed@lists.ozlabs.org>; Mon,  5 Feb 2024 20:50:22 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so3130454b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 05 Feb 2024 01:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707126618; x=1707731418; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyxLyOfbVqgM9WmxXwGUihLV7GhZ9dmSNbUWWpB1kbo=;
        b=DwgbAIrmmgnfaicNs7gb/B1QBKAQdQEPtuN/YMQhGT0KTjZrTF117kdYojblTMxGAl
         OBiMlUoAOjlc8NLQblxGXjkZ6HjMH115wMWT26U+vPhgb7yLEIP+SMU0y9NL69nifL0O
         gE41UpnPjv0QBHj2Y+Is8ZINeWzLB0jLX+Dk9W2Uaux7UgiZC65R3sAndSMRM+uI++NX
         GIt5CZloZ11bQ/wdVS5OIK/eYL3ts0/B3NknGVrDY76wAa7f9EpB35iemZilggx4jQyb
         Ktv996qhNRwQcZc6p2OQSaARgY1KOIZvmeB3VzkK1TIiVRMaAaYLMogRZwjILXLPEmOO
         qSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707126618; x=1707731418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyxLyOfbVqgM9WmxXwGUihLV7GhZ9dmSNbUWWpB1kbo=;
        b=n2PdPCoK4RsnqSL+OCsZH6JRp3AW3JsWRtsvptgRXYGIaj5bkhBsJfpK/QG/zQp+d9
         bR0fhzVDVr6NRNjd/q4md2SIwpoMWHw4fT3czxUGzJcIIzkzAxqiOzxV/DTWm/dVaklf
         m63IMX6sPF2+IWFa6Ojgrh3NXHIjROlJEDDHCBFAC3SHNRM+PSDATZd7PtxlAA8Nt1yC
         ZtiyH1XyPSMCcNFjuioDZXKsEVfGuXnpBtjYHas1bWQZD4eLRdr3q26/Fzy4yYQ0PKbc
         Vh8in15K1GwDzuG6n0mgL2ryLQ8TM9q03GDVfg+UOVA4csZneYDPrgplNquCpqww0AoV
         /chw==
X-Gm-Message-State: AOJu0YweKWWYFT/oXKBoj1vajP+wvTw1+h1nHaJpbdCpO+Vdjw2RQeLr
	tYY+1cXL7TsockChxAsp8I0EOaHf+Nyf0SU51u/sy8MDlcM+CpEV
X-Google-Smtp-Source: AGHT+IEaQlbMDkqls+1z356bkMGfAyosJJfP6FT4PccIh0PILxVE9gnQR6IFhec+C5UYqdVXv36p6g==
X-Received: by 2002:a62:e712:0:b0:6e0:3ef3:db3c with SMTP id s18-20020a62e712000000b006e03ef3db3cmr2696758pfh.29.1707126618105;
        Mon, 05 Feb 2024 01:50:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXCwihz3NvpgC9gV7esiVF9I1di4G/tdzvEwGpDMug8aT8iuL1ZcyvFDxwioqQhicoFmS2+U0/SqaLJvUhb0WiRP/bp6CchoslH868BFpy4DgpDEbfnNZLpiE5GCqJ+c8wTTBbDHlcY5wEwtkZnmPudtAlPzQEPDvgDkvn4kejFrfvfYlrO6yEWalSJrDPGghQZbrrH0el23aBwW5Wl78DdevWRIGBetaDQ8Rl3kQWa9JDGzODztNOiRDPez+sZIeQHmRmpIvoSOSVU2NI+HMeXC9/A1rFLBPdeYvK6B91Vco25iEcf6BnqN4tsKu0ComBO/ThR23H+VgSBa/k2k42DyegcBFWE1Eczddqq8Ruey9cieXVxSLK3CVQptyqKr7V5wPOgg3cEDVT55WKsQs6+udWIHwgkGZeh2Tqo/yl0X/YwcEGrPdZnMDZXPGTXBwlDUtL1ehef3feEWXhmDptdnLGD9inMm+PMK1TyGeiLz+TPZQiU7cG2dVgpG0b27vvDA1BHzEn2ldWq37dPacfq9OJvVeS9yptfyzqtX9xmdpc8VSuUH7oimfLzyaKxqxXKjaHRGu5Oh+xqI3zblgj3Ml/aOKAXPngklDkuckbssdBUk87cqHvlBDgY9KGYXcojZ7jg8QoeTITkHmz3oJw8uOtWpv1lRdass5luG3OxqWWy04qcrf9QqaZ0TCxlI/TnKPsvL3agms3YrpDgtA7gxuQ6I3bWgvBqg7Z+5TLPgumjGqUu
Received: from t480 (89.208.247.201.16clouds.com. [89.208.247.201])
        by smtp.gmail.com with ESMTPSA id i21-20020aa787d5000000b006e038327bbesm2757236pfo.79.2024.02.05.01.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:50:17 -0800 (PST)
Date: Mon, 5 Feb 2024 17:50:08 +0800
From: Shawn Guo <shawn.gsc@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/3] arm64: dts: imx93: drop "master" I3C node name suffix
Message-ID: <ZcCvUJNslxafvCab@t480>
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
 <20240117075618.81932-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117075618.81932-2-krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Nicolas Pitre <npitre@baylibre.com>, =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Conor Culhane <conor.culhane@silvaco.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jan 17, 2024 at 08:56:17AM +0100, Krzysztof Kozlowski wrote:
> Following change in the I3C bindings, the "master" suffix in I3C
> controller node name is discouraged (it is "controller" now) and not
> accurate (if device supports also target mode).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!
