Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E2D99358E
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 20:00:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMn3x1l3lz3bcp
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2024 04:59:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728323995;
	cv=none; b=AWxQqbXX6AZ4WHi0h001xbi8hkJg2v41Vcump7XC0GkE/KKgHRbx3cJ1wVEnNZPsXqlIi35MNeZLYJrwGhsOTukGz9cSl62VSNjUgvVSlGlvg/yPig+3nYEjsJ9LqirRqdy7vcdmHjh8TRjGQo1mMyGU/C3dMXX4yX+zw8Bl7g+Yp710n1dSwWewySUuYCZoVni/oFX+9biArDbSgAWu6lk8CAutUJ/+v0WkZG1+/Y0ozOXnaU3Dj5AcdHFgBDh81zUQIYjQ+P9qt1rX7QCPJ3NFkOaHrrdyKe2PbwtaeJttYUhoYWSciLvy+sNngRG0M6gKxbYsrXGw1hl1vEJuMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728323995; c=relaxed/relaxed;
	bh=lRq9/7xf0OzeeZlZiRi6QM0IOW8jg/QdVQsBpUKBlGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HE9Vg8Oaq/W7tJk/sSFT1ZjAHEj0i35PfCuXzlURsf3OmFzd71ZmpFw9kMjxpQCmoEHQrwQ4ks5hAtXxB4bNC33boXTkIXfDTGRwwYTls0rjDCA9P7ejfTJ6yFJIY9qvn/55u4wevwkZSqpMayLsgz05SA685qTbrwqgs0Z67P/i+rHeImOFyRd5RbOqz5JT4f9+8IaFa6KunsUjmCeghb4I1AC4KaunzlDxAfNoE4/VOJEyptjPEuK628K0ledqi4Rc8Hw+gTKJYTtl7wiKSpgVhxequzks82fVLB/Mw+5o2P//HMRUkCKnt0OOG4VIuDEoXoeKPI33z3wmaPEy6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nq+TQvbd; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nq+TQvbd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMn3t1H8Gz2yx7
	for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2024 04:59:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1BBAFA41F4F;
	Mon,  7 Oct 2024 17:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2DCC4CEC7;
	Mon,  7 Oct 2024 17:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728323990;
	bh=nX4QdvK4jon6rwcgdgSFV/YaFDuwES1YhsvSlSFRGic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nq+TQvbdERuBePxTB4ZMGYW1C13CoKCVd0CTzUs/6e5JZp9lz7LWMnY57/sPa7Ut+
	 Tq2Wb6XLhgOBjqavluAa4FJywZOXi1gUtrXOwSX8SskoIfUW18iiEyGkfTIKuteDtX
	 4t/YsU4EbyaeJF6EIbiQ69mt0mdgw6w5pCcuVb+Ns3R/5WCQZz9axhJDNXP5q22U7b
	 JWdrlOhK062mXhH5jw8fhMHLrXooaKggTmyXSQ8J4t3CCRVkgHH9FzgGgeumVx9VfW
	 ZSQkiocKHFIh1OohSwQnsfwLvIdoOfNCS2kU6e46pQOImlIT74CPnOELVAsNhFF9RD
	 fjA4gNrftwPnA==
Date: Mon, 7 Oct 2024 12:59:49 -0500
From: Rob Herring <robh@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT
 SW reset
Message-ID: <20241007175949.GA1738291-robh@kernel.org>
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
 <20241007063408.2360874-2-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007063408.2360874-2-chin-ting_kuo@aspeedtech.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Patrick_NC_Lin@wiwynn.com, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, Peter.Yin@quantatw.com, Bonnie_Lo@wiwynn.com, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, patrick@stwcx.xyz, krzk+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Oct 07, 2024 at 02:34:05PM +0800, Chin-Ting Kuo wrote:
> Add "aspeed,restart-sw" property to distinguish normal WDT
> reset from system restart triggered by SW consciously.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>  .../bindings/watchdog/aspeed,ast2400-wdt.yaml         | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
> index be78a9865584..6cc3604c295a 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
> @@ -95,6 +95,17 @@ properties:
>        array with the first word defined using the AST2600_WDT_RESET1_* macros,
>        and the second word defined using the AST2600_WDT_RESET2_* macros.
>  
> +  aspeed,restart-sw:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: >
> +      Normally, ASPEED WDT reset may occur when system hangs or reboot
> +      triggered by SW consciously. However, system doesn't know whether the
> +      restart is triggered by SW consciously since the reset event flag is
> +      the same as normal WDT timeout reset. With this property, SW can
> +      restart the system immediately and directly without wait for WDT
> +      timeout occurs. The reset event flag is also different from the normal
> +      WDT reset. This property is only supported since AST2600 platform.

Why can't this be implicit based on the ast2600 compatible string?

Rob
