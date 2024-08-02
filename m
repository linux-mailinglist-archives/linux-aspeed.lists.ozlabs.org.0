Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E70E9579F9
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKz6phyz3cCx
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kboptGib;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=dmitry.baryshkov@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WbFzr468rz3cW8
	for <linux-aspeed@lists.ozlabs.org>; Sat,  3 Aug 2024 05:20:54 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-67682149265so72016507b3.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 02 Aug 2024 12:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722626449; x=1723231249; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gZNwK4s34iYGvIbS46dI7pOTIc2gw03JA9isN6WtOpc=;
        b=kboptGib+MpCu/JbVhjj8PGxczh9Y4/54eKKKk9MiMnUu+GxsjOMw8Jchp495dj85X
         4IXPdeL7GvxBbDKxMZTOylCzwM5tPtyurtdmMlmAvnaIymB7l7IKUCzx6Web9w65HAmG
         I1dNEaAZDn7mrCgwu/CDdHVVBoznV0YYYn7Ay2Z2sNzPmBd8ue2NBXaCgr8zd/8F66tX
         mZqiLYMKw/6V+jT7TVoIXrmOGWyAl5i/V/MGcqV0NlozJwf3ZTZZSTC8hFw9O75JRLvH
         sDsgxNbsOc6J0GOVh5CFLhbrcZEH7RNET2Y1y76Nj0TIGgaOItZkoJAZoJPU9a0KTBea
         l8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626449; x=1723231249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZNwK4s34iYGvIbS46dI7pOTIc2gw03JA9isN6WtOpc=;
        b=mQZFR+9HHPRpgimbADLfrv73e166zE7Khp1MAtgkf4CPJX5RvsheXFwUlaWnFvQGd/
         Mhg/H5ZHN9QITG5Cahu3gZ4uNzBPccp1uyMTdmNkCi6KRTPX4fiHN6VVHCuj0OBR6MZ/
         XYUbAdl+Htd3Q1rmK8ilA0W98ojP3eukLnkTIX2iHWpfkBlJAMTRv9jCNBrlcZEXzwxu
         3lZxy8TX754TWZOZ6IQgLOCG+JbGZ4LdC1lW+T7VSucdNdY9XyomFuKMJstB7qXqSTIu
         DhQZs4F9xyjx/UHAShmtREVsw3f1+HyFaqPhiROAkb7ZKXxpKpTMZ65rK6O7pdyFg5Lc
         X9TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVXvVg0b5Msq6vttpHFdl46amdLvFd3isLha3bLme/GC5gd68Tc/jDrQ5PzxFii6viPPO3y8Ju92ZDx9P0ORoJSWnU904KUzR0oqpI3A==
X-Gm-Message-State: AOJu0YyLf3biadKsEAHf1iCqRVjhSdpGx6pY/FGuDd2gLIr4kWdIOavW
	YEuK9vYHJ1qxyRP3GiZzPZIdjs+ibuxJUydRQZObWxLRit5vZy0GA+5P5jCnw2zwqo8EAG6841/
	iZ8NsAAsXJcQH9iznhG7R1DP0QrJKqFkVgjbbuw==
X-Google-Smtp-Source: AGHT+IEqzG5OJVYb0N/hhSy3/aCVZpwuaC57g1J8oBIELAMwqUOkxVNDUu61cFnvy19WDb7qlbHaefm1NS450MOTFBE=
X-Received: by 2002:a81:c20e:0:b0:63c:aa2:829d with SMTP id
 00721157ae682-689637fccd4mr52822217b3.44.1722626449505; Fri, 02 Aug 2024
 12:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240802090544.2741206-1-kevin_chen@aspeedtech.com> <20240802090544.2741206-9-kevin_chen@aspeedtech.com>
In-Reply-To: <20240802090544.2741206-9-kevin_chen@aspeedtech.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 2 Aug 2024 22:20:38 +0300
Message-ID: <CAA8EJprcmQvE3PjySxBKq7Qv3JHJHhic2aQ5MDnwZaf-D=K2Rw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: defconfig: Add ASPEED AST2700 family support
To: Kevin Chen <kevin_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: geert+renesas@glider.be, catalin.marinas@arm.com, mturquette@baylibre.com, will@kernel.org, linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, m.szyprowski@samsung.com, robh@kernel.org, quic_bjorande@quicinc.com, nfraprado@collabora.com, u-kumar1@ti.com, lee@kernel.org, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, conor+dt@kernel.org, arnd@arndb.de, soc@kernel.org, linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, olof@lixom.net, krzk+dt@kernel.org, shawnguo@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2 Aug 2024 at 12:05, Kevin Chen <kevin_chen@aspeedtech.com> wrote:
>
> Enable CONFIG_ARCH_ASPEED in arm64 defconfig.

Why? Usually the defconfig changes have "Enable CONFIG_FOO as it is
used on the Bar Baz platform" commit message.

>
> Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7d32fca64996..b393735a695f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -38,6 +38,7 @@ CONFIG_ARCH_AIROHA=y
>  CONFIG_ARCH_SUNXI=y
>  CONFIG_ARCH_ALPINE=y
>  CONFIG_ARCH_APPLE=y
> +CONFIG_ARCH_ASPEED=y
>  CONFIG_ARCH_BCM=y
>  CONFIG_ARCH_BCM2835=y
>  CONFIG_ARCH_BCM_IPROC=y
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
