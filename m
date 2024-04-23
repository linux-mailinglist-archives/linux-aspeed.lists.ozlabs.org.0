Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C47358AE8E7
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Apr 2024 16:01:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qww5zQ8M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VP3gW33L7z3dTC
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Apr 2024 00:01:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qww5zQ8M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VP3gM1Xs3z3dDk
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Apr 2024 00:01:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 992FA61446;
	Tue, 23 Apr 2024 14:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD06C116B1;
	Tue, 23 Apr 2024 14:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713880858;
	bh=U5ONziDaCttdPKhkIOEueLEAiyPNH0TnEDai6u5SLNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qww5zQ8MpvVgMCgYso0anl+IDVueBE7HE0bQqpm3UfHjVqss83se6mrRVVbmhnSHE
	 inP3GOhYCBMyamNWjEALHnoNBFHqIKFNY0eGZvvPLRAESMtEDuogW1BxCa7xLZR//B
	 lEkIek9mkZjg+oZA87gEtkkHpLJJMs88LE+HQXUgrOJMHd5wFo+h7+nc1DYjUCQzug
	 p44dEhTE+jCPUQo++URXAqwdnuqKuuRbD9up3rCYDyXhhOBiwi6gO4U0osXUJie4js
	 O2gNfADYS1CMg+R2tfeioc8PJMg4SuIKvDPEl4YABHYGeHmfkLU6r81gEo4Jw3cQbe
	 KyJHtIVfIG+Og==
Date: Tue, 23 Apr 2024 09:00:56 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v2] dt-bindings: watchdog: aspeed,ast2400-wdt: Convert to
 DT schema
Message-ID: <171388085227.112740.4043099256538346209.robh@kernel.org>
References: <20240403020439.418788-1-andrew@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403020439.418788-1-andrew@codeconstruct.com.au>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, zev@bewilderbeest.net, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net, linux-watchdog@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Wed, 03 Apr 2024 12:34:39 +1030, Andrew Jeffery wrote:
> Squash warnings such as:
> 
> ```
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/apb@1e600000/watchdog@1e785000: failed to match any schema with compatible: ['aspeed,ast2400-wdt']
> ```
> 
> The schema binding additionally defines the clocks property over the
> prose binding to align with use of the node in the DTS files.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
> v2: Address feedback from Rob and Zev
> 
>     - Rob: https://lore.kernel.org/linux-watchdog/20240402180718.GA358505-robh@kernel.org/
>     - Zev: https://lore.kernel.org/linux-watchdog/65722a59-2e94-4616-81e1-835615b0e600@hatter.bewilderbeest.net/
> 
> v1: https://lore.kernel.org/linux-watchdog/20240402120118.282035-1-andrew@codeconstruct.com.au/
> 
>  .../bindings/watchdog/aspeed,ast2400-wdt.yaml | 142 ++++++++++++++++++
>  .../bindings/watchdog/aspeed-wdt.txt          |  73 ---------
>  2 files changed, 142 insertions(+), 73 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> 

Applied, thanks!

