Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FF5979EF2
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Sep 2024 12:09:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6gcL2fwJz2ysB
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Sep 2024 20:09:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726481342;
	cv=none; b=gqFujLGwxh5weZ99e97uQS8T0fgYHajpQbQD2W/hWW09/1Obramf15ujAfkVd96cVhdRAR0NY2BM2dDKsS+d3ObTu5g9hWumZca238nTT/zPjXIBSBua3sq5Qf/DlQxJnBR+2FVpEz5y73+DVmq1NyBl+1agK6rjChV9aBjZ4hmaNgBZ7RJd2cJzTJHieFGrIBxiEWpxtz/WgHuQgW5Zkf/dVC4l/qF9PWOflUcGOj0m0SrE8MH33fj7h9yT5o3L4rRLhbVZTVETbC1L3QcST28Yxy+MMZ86ssZqN71twMbSLnXmvLvaNJvCfs23NQBWs/PqBMxU97No8ZxlpNtmdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726481342; c=relaxed/relaxed;
	bh=NicVSKto3CNl4cWFWCOaagNw0+dyANQp+qjYo3OQGeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XsT+VO+Lgy5r9Q6SCFbhDcLVR/osBf7OBg5gOfsQxuM7+RQ7AaKd4LsrldgPZ3JwglpA9ayoYfx3pTEIVryS8XFBTYrdkK5lo637vxhhEzPUV7MjWnAOcdxxJWqDhquBb469lzvUI5cJf1RGjb7l8nQBJBi+ZoKHte2yheCLytaWAU7pXTDBvvtoBbAp8nykuKiDwVFF6U3x2X5ZsfTyT1rgQGN7a4OkG6E/MXuFDLu2h4GjJIYzPhxki8xX7P55F2J6hTqlEF5netvPvsyf/Ixn+0ryteMybYv/kVxQmTeUEwIbLv5Y5MmQzF4DznVMblFmYbQLnNmSbzgFj0uNqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OKCVaXHp; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OKCVaXHp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6gcF50phz2yTy
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Sep 2024 20:09:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 74610A41C8B;
	Mon, 16 Sep 2024 10:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D7CC4CEC7;
	Mon, 16 Sep 2024 10:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726481338;
	bh=T8PPk/YjtiwccMrPvJSUH0/CkXxHzepMK8YfYya0uIY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=OKCVaXHpyuFTiSIHNJfFNzkEYZ61+i5SfGrDGnyySHLsCQYclH0uge3MRD1nczVug
	 hUje13rPUBrxTGSiV2p0sCQYgw5JmGqp1qMRUFQroQK7E3IVXBCMGTFOsY5gIq43DE
	 BY91V4O+kcwF0V0eB08/GAGjrFYwyPFSIVjvDENrSX2F0XD3ST/vo7GKLwGcbQ1BA2
	 L3gErmdmvVhKYPaDQVBbwaVrzicGH0z6dCghSduxJCHfN36Q7s61HUferH5G/Gsi7+
	 9wCxRUkINNPACPB0dC7Bn5cz0Moh3FHvYjdagkyctsS84q/UQRHZrU8ZumRR9G2i0Y
	 FT36aGYd/t+Dg==
Message-ID: <9b356379-907c-4112-8e24-1810cfa40ef6@kernel.org>
Date: Mon, 16 Sep 2024 12:08:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: aspeed: support for AST2700
To: Ryan Chen <ryan_chen@aspeedtech.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joel@jms.id.au, andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
References: <20240916091039.3584505-1-ryan_chen@aspeedtech.com>
 <20240916091039.3584505-2-ryan_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240916091039.3584505-2-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 16/09/2024 11:10, Ryan Chen wrote:
> Add compatible support for AST2700 clk, reset, pinctrl, silicon-id for AST2700 scu.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> index 86ee69c0f45b..127a357051cd 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> @@ -9,6 +9,8 @@ title: Aspeed System Control Unit
>  description:
>    The Aspeed System Control Unit manages the global behaviour of the SoC,
>    configuring elements such as clocks, pinmux, and reset.
> +  In AST2700 SOC which has two soc connection, each soc have its own scu
> +  register control, ast2700-scu0 for soc0, ast2700-scu1 for soc1.
>  
>  maintainers:
>    - Joel Stanley <joel@jms.id.au>
> @@ -21,6 +23,8 @@ properties:
>            - aspeed,ast2400-scu
>            - aspeed,ast2500-scu
>            - aspeed,ast2600-scu
> +          - aspeed,ast2700-scu0
> +          - aspeed,ast2700-scu1
>        - const: syscon
>        - const: simple-mfd
>  
> @@ -30,10 +34,12 @@ properties:
>    ranges: true
>  
>    '#address-cells':
> -    const: 1
> +    minimum: 1
> +    maximum: 2
>  
>    '#size-cells':
> -    const: 1
> +    minimum: 1
> +    maximum: 2

Why do the children have 64 bit addressing?

>  
>    '#clock-cells':
>      const: 1
> @@ -56,6 +62,8 @@ patternProperties:
>              - aspeed,ast2400-pinctrl
>              - aspeed,ast2500-pinctrl
>              - aspeed,ast2600-pinctrl
> +            - aspeed,ast2700-soc0-pinctrl
> +            - aspeed,ast2700-soc1-pinctrl

Are these devices different?

Where is this binding documented (fully)? Provide link to lore patch in
the changelog.

>  
>      required:
>        - compatible
> @@ -76,6 +84,7 @@ patternProperties:
>                - aspeed,ast2400-silicon-id
>                - aspeed,ast2500-silicon-id
>                - aspeed,ast2600-silicon-id
> +              - aspeed,ast2700-silicon-id

This one is fine.

>            - const: aspeed,silicon-id
>  
>        reg:

Best regards,
Krzysztof

