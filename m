Return-Path: <linux-aspeed+bounces-2896-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6988AC5AFB5
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Nov 2025 03:14:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d711C2HsHz2ySq;
	Fri, 14 Nov 2025 13:14:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763086479;
	cv=none; b=WESm60fvWHsGqoMw14M94nEmTvKEI5qzUqgQHujYqPo16861QFg6E0c7UaT9iKODRpz1Rb7RYRyAeP2QkkIAOxb5S530vtEfGkGXRlADzqUm1qpKkL5unWUD3AKeudGXgAm3LTR4g4JnLIF/SV8zqRhzoCurUldwiTrEqi+jdLTHDyPeyT7kzBmL88uP+mFT+qKGtP5juXKpZ0AvQ5va0xJYqvK/VhlIE4yugCx9c52XtZynHUFrg4CxE6XaQ2C8YOuukLNenF5m7wKqLKVMjtiyYWXRtk0pVzJv2jjPwXyLvG352+GUnpDcW0WJURIm70ghNXTTQYsUJiIu4RBZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763086479; c=relaxed/relaxed;
	bh=EUQzdVCI9Ss5QrwdmvciMMLlU7W9sG3oUSRRxCeCzFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fHEcrk3MshJ6DkUDKxDrYzJrJ/zBYfmFUZOLjpYP3NPIeZs5LwY2sJEHPq0Qn2TJ0sylGyjfmkTbdjlUMjYwYJsFW8vcjLU76EnuYI8nueDRxEn1gzReLPaEy3RiuTQDaZ5F9lR4y0/5k2VYIssPU4IsiFsnUiGa19/yHfvHIFLcQXz+3DEym48yyZnivghGvDzJ2DSfRzqkXMEjv2m6wWA7p+DbWM0FFmMq0ewTdSvBIIElojXnBoQQIlEbvqTtMTby+PxA0zfr3hB/xvtRtVLuyR1V5VLsUPxnz5ijZKpx0CCpgTxx01AWhzPZhRTDTMpCa9U+uehqRl7I76KIpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=gNZ+N0XW; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=gNZ+N0XW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d711946mpz2xlK
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Nov 2025 13:14:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763086476;
	bh=EUQzdVCI9Ss5QrwdmvciMMLlU7W9sG3oUSRRxCeCzFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gNZ+N0XWNfy4GRAH3j2k0iWaIimQhH01+1GtLcyY+mWhCAySKtgMOKEclhZtNVpPS
	 +3B3lxVwFHV8hDUCISyuFBVOe/juAEY2CZ1NGb1RqvSuGrR2KyasVPOg73eFOMo0tr
	 wSv0wg6ktaTH1UVG8/6PvZWK2cG03AEHRii37CF4C5LwcuLNNvLAXZItkE8RcEhOY7
	 L+1Q9tW4K+lN0BDG1lCSU6AykWuh0bn6hLPnT1dB/3wnxURSR3FinUV+1eF0zq6HbC
	 deMznNYI8qgdemk4EfZy+Oyd3ueLdz4YeBWqRuTDaW1PJYPbSSrBzd5l2Oh4CSAILN
	 0sDk/nOXbVv+g==
Received: from [127.0.1.1] (unknown [180.150.112.244])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9B568641F5;
	Fri, 14 Nov 2025 10:14:34 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, Cosmo Chou <chou.cosmo@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 cosmo.chou@quantatw.com
In-Reply-To: <20251018043310.1056032-1-chou.cosmo@gmail.com>
References: <20251018043310.1056032-1-chou.cosmo@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: bletchley: remove WDTRST1
 assertion from wdt1
Message-Id: <176308647425.812008.7414923561320240836.b4-ty@codeconstruct.com.au>
Date: Fri, 14 Nov 2025 12:44:34 +1030
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 18 Oct 2025 12:33:09 +0800, Cosmo Chou wrote:
> Remove the external signal configuration from wdt1 to prevent the
> WDTRST1 pin from being asserted during watchdog resets.
> 
> The WDTRST1 pin was originally configured to reset the TPM during
> watchdog events. However, the pin is incorrectly routed to SRST#
> on the hardware, causing unintended system resets. Since the TPM
> is not currently utilized on this platform, remove the external
> signal configuration to avoid the incorrect reset behavior.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


