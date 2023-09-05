Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5158792D48
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Sep 2023 20:16:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BvR15sG5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgDH92xj8z3c03
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Sep 2023 04:16:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BvR15sG5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=6yhg=ev=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgDH06n9qz2ykZ
	for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Sep 2023 04:16:44 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C13C9CE1282;
	Tue,  5 Sep 2023 18:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D97BC4339A;
	Tue,  5 Sep 2023 18:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693937800;
	bh=eE6iIeJVyd5A3sLT9gWxdxdxpP7Nmi6eTWp1cJDxjV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BvR15sG5UVzUcajsRUOMr5AwbM9zRPQZRjn+B0gUL8f1aU//0yQbqrFn8Ej1pYlxE
	 3ephHqQeEHUsLGc7PP02lE+ZVADCl/pTnmp13VdDOOBlkQSHIPJP6Nj2H+zOjL7rJz
	 SxiKt9R4U/piA/nBrKwKx+bVjBZtbsF98ZXBLUfwNT5uiXQwDc0Mz2oIwMunLEXug8
	 OZiD5HkqVXY3wosa2vgNHxvO3wzLewk7AeoBDoiZW24YDCnVqmSKRiuodfjGUduz2X
	 mlwn/1zElcaCU2u7O/0+GYROTeHpvgPAnVc6/KYWwhWyBx+tF4nyyI28IFB8v9VKHO
	 Wvoq5zvgQL49A==
Received: (nullmailer pid 3743858 invoked by uid 1000);
	Tue, 05 Sep 2023 18:16:37 -0000
Date: Tue, 5 Sep 2023 13:16:37 -0500
From: Rob Herring <robh@kernel.org>
To: Peter Yin <peteryin.openbmc@gmail.com>
Subject: Re: [PATCH v8 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Message-ID: <20230905181637.GA3742088-robh@kernel.org>
References: <20230905062223.774871-1-peteryin.openbmc@gmail.com>
 <20230905062223.774871-3-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905062223.774871-3-peteryin.openbmc@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, peter.yin@quantatw.com, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Sep 05, 2023 at 02:22:22PM +0800, Peter Yin wrote:
> Document the new compatibles used on Meta Minerva.
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> 

You should not have blank lines between tags. 

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 68f717670f78..32582ee56264 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -79,6 +79,7 @@ properties:
>                - facebook,elbert-bmc
>                - facebook,fuji-bmc
>                - facebook,greatlakes-bmc
> +              - facebook,minerva-bmc
>                - facebook,yosemite4-bmc
>                - ibm,everest-bmc
>                - ibm,rainier-bmc
> -- 
> 2.25.1
> 
