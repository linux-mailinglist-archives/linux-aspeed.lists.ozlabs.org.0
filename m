Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D2197E83C
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 11:09:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBxym27y8z2yYd
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 19:09:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727082590;
	cv=none; b=TnnL+TyfwVjJTflTMD4xEjptgogouQEFksIGrnnHDR3b7JvgK9KMCg7DDbBVH6e5yyWX2nfc9SAqKcFE0uiud2nQNCwzRbumA/pV+X/cacvBjeJODDPFYQCAwq61etyH8nDpTqX6EOAe2urRjIr+ImL+DM3vH7iHVbcNv9GUUhCM479wy7OH/mWOabuypTy7gbGS9DrXb+0Ipy+F9iCELRVndwg/8wu4Jx8pHRon5RIsPEjGX4a0s2W+tdrB2mNJQhceafMmJLBDLsVXsI6AZQJg7k9lfrKBbzetGpClZ6MeYxqrfcTuX9sBgf9XSfrs+6wdme1E3uw3p/kWUa2O7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727082590; c=relaxed/relaxed;
	bh=QT8pePOvSY9eEgTnWRTjJKAnuGSa1v7IyLw7vcQdc1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ihk9H7pKi4XQM/bD1HMxodfSv0LUC5zOdrO9lfZo8F0EEHYEe/nZbSjkc6xQPmuuPK55K6gzvSlXiJbTOnTdMCfI3nD4di/fEYYQgi/EfCgzudJ+EftQccMFBrj4EyKkHxg98ek8+dTOYkIzPFcYh0s0GBlkkaWWCjQVkqRfq9V81fMWIoOfsqW2EaHHe+c1uWpDGm2nrFRVoNiSj377xXY39T0Njq+t6K+Iu6yXqaBt/B0XvpPXJmCWmmLRGambwVLoX3F/i+MnLog+4Ay4hsOpHgmImFmVdPOjvn6vzNWvgSrAPYlBVWavvXw0D6csfvk6fRJq32D1uYUzyBGc3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yi/EQek8; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yi/EQek8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBxyk22DCz2xYw
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Sep 2024 19:09:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC98AA41818;
	Mon, 23 Sep 2024 09:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4B9C4CEC4;
	Mon, 23 Sep 2024 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727082585;
	bh=Kgq8MYspzutcGWDFpoter0hnpOzpTVNYh7jCbDxMsAk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Yi/EQek8n+LGMeJcPmz85ejoyJhmDFhRC9JCAyDW7hYyuZ143NMZa8APZ1nauT2FJ
	 HClH4FZxtInJTnd4on1QnRXu6JKi5QGhrqk5gqwgL9R7m7Kb8F5AJ6EKmDbae3EDei
	 nPUNBDj/jhh4QHm0REAFnWIJDy0RFi/sF4tZEwxvrWwWsJNhjG0NvHf1+4CLFa5F4e
	 yqoWssip6iIhnlm5a6nQqI9O2f3/vKuFQehXuWAaY+m//hnB4x2j6d5icM3GFmEUUc
	 sWuUHfNZZdVbCCb35v9fxoqqu0sDgh8DSULm31v7p2HUSP/bCj/biw6Dv6agyve8gG
	 t1kj0i0YGT0gQ==
Message-ID: <c02f84d2-1306-480b-b6b3-15d3ccae16ad@kernel.org>
Date: Mon, 23 Sep 2024 11:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: aspeed: support for AST2700
To: Ryan Chen <ryan_chen@aspeedtech.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joel@jms.id.au, andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
References: <20240923075012.2264573-1-ryan_chen@aspeedtech.com>
 <20240923075012.2264573-2-ryan_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240923075012.2264573-2-ryan_chen@aspeedtech.com>
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

On 23/09/2024 09:50, Ryan Chen wrote:
> Add reset, clk dt bindings headers, and update compatible
> support for AST2700 clk, silicon-id in yaml.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml      |   8 +-
>  .../dt-bindings/clock/aspeed,ast2700-scu.h    | 163 ++++++++++++++++++
>  .../dt-bindings/reset/aspeed,ast2700-scu.h    | 124 +++++++++++++
>  3 files changed, 294 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/aspeed,ast2700-scu.h
>  create mode 100644 include/dt-bindings/reset/aspeed,ast2700-scu.h
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> index 86ee69c0f45b..c800d5e53b65 100644
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
> @@ -30,7 +34,8 @@ properties:
>    ranges: true
>  
>    '#address-cells':
> -    const: 1
> +    minimum: 1
> +    maximum: 2

I would still argue that children do not need full 64-bit addressing,
but fine, you can grow their space as much as possible.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

