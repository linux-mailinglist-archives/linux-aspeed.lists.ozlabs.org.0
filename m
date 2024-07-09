Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB8292BFC9
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jul 2024 18:25:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iHUIDBE4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJRDw3Gctz3cRR
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2024 02:25:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iHUIDBE4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJRDn1DNMz30Vh
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jul 2024 02:25:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CE7F614D4;
	Tue,  9 Jul 2024 16:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051B3C4AF0A;
	Tue,  9 Jul 2024 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542343;
	bh=HNZERyax7YfeQp01st75pcXuzHJEbSApRID1V7p3OuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHUIDBE4GwDL2TuhKWi3TEIqXmzbP/vCD/CeAe6EkVKb3NC3tMP1dYiGFzXlNqoxh
	 BjBnQU3sGIt9PcajkS1QI8Ufz4/VCk1QNGm3Bd8hdCstWib+384X2BIMDknG6Y8BK2
	 kcsaTJBMSJFfi8XQ9R0gyIaMsrXHCHGyR6mXSTUn6E0Z4m4hXk90PeQ12cOwEx/0CZ
	 xp3vliteT2PpbjprrlX75KtrY7aLPxLCWhiRIpNrd+6cRdQmg6Rx06hXOpKyTmMrWU
	 zUWWx3FM2x38dHdKoVuzF8qIj8t+GYlNkWyiuTDhd+Fvh0uPWIoTRbXJATS/vujvzi
	 k8lfXH8F9Hg0w==
Date: Tue, 9 Jul 2024 10:25:41 -0600
From: Rob Herring <robh@kernel.org>
To: George Liu <liuxiwei1013@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: aspeed: add IEIT x86 platform BMC
 boards
Message-ID: <20240709162541.GA3680692-robh@kernel.org>
References: <20240708034848.100930-1-liuxiwei@ieisystem.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708034848.100930-1-liuxiwei@ieisystem.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jul 08, 2024 at 11:48:48AM +0800, George Liu wrote:
> Document the new compatibles used on the ieisystems
> 
> Signed-off-by: George Liu <liuxiwei@ieisystem.com>

Still confused with the 3 names: ieisystems, ieisystem, and ieit

The preference for vendor prefixes is domain names, but if ieit is a 
better identifier please explain why (in the commit msg).

> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index e386d0ebfb14..818fbe9c45fc 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -92,6 +92,7 @@ properties:
>                - ibm,rainier-bmc
>                - ibm,system1-bmc
>                - ibm,tacoma-bmc
> +              - ieit,nf5280m7-bmc
>                - inventec,starscream-bmc
>                - inventec,transformer-bmc
>                - jabil,rbp-bmc
> -- 
> 2.34.1
> 
