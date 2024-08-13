Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 096A695095E
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Aug 2024 17:46:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mxl558Ed;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjwjG6j7sz2yTy
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2024 01:46:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mxl558Ed;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjwjB1VxRz2y1l
	for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2024 01:46:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8E759CE137E;
	Tue, 13 Aug 2024 15:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C02C4AF09;
	Tue, 13 Aug 2024 15:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723563977;
	bh=FvDI4nlATbEYWH0NbvBp6D3TEzj2s0THCNv0wUb9Nio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxl558EdqqOlZgrgDdD7dFRsuTIs49yoF8wlBy7H8k1X3YmBciUxBFZIkGDWLt+H7
	 geRHZohMuF69M9rlD520230TJnguWjRV7zmxiRVOkkUXUVwcbwqlUH14k4kDELN7pA
	 K6aRPCxP4YwrmH+VhR1I5XNDFjXoqOkmmctDhj/4hN+lEY/p0Cdaavoh3zZ2g+FsmI
	 hSnQFNt3yhvKCfh+AGHInbgw30H5wD1CTSoOIJzhfph/Jvb0MQtdMlwCLIouo3W0rI
	 pPncL0GrdCQQKUKZ//jkt1vFFmsBBWj/re7N+HJ57xawlMCKVPn135WN2YxQvdhdmH
	 8NnkkJUCuxkvQ==
Date: Tue, 13 Aug 2024 09:46:15 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller:
 aspeed,ast2400-vic: Convert to DT schema
Message-ID: <172356397447.1008665.7000351139259690854.robh@kernel.org>
References: <20240808-dt-warnings-irq-aspeed-dt-schema-v2-0-c2531e02633d@codeconstruct.com.au>
 <20240808-dt-warnings-irq-aspeed-dt-schema-v2-1-c2531e02633d@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808-dt-warnings-irq-aspeed-dt-schema-v2-1-c2531e02633d@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Thu, 08 Aug 2024 13:44:24 +0930, Andrew Jeffery wrote:
> Squash warnings such as:
> 
>     arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/interrupt-controller@1e6c0080: failed to match any schema with compatible: ['aspeed,ast2400-vic']
> 
> The YAML DT schema defines an optional property, valid-sources, which
> was not previously described in the prose binding. It is added to
> document existing practice in the Aspeed devicetrees. Unfortunately
> the property seems to predate the requirement that vendor-specific
> properties be prefixed.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  .../interrupt-controller/aspeed,ast2400-vic.txt    | 23 --------
>  .../interrupt-controller/aspeed,ast2400-vic.yaml   | 62 ++++++++++++++++++++++
>  2 files changed, 62 insertions(+), 23 deletions(-)
> 

Applied, thanks!

