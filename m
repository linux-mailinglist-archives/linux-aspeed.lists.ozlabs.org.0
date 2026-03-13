Return-Path: <linux-aspeed+bounces-3668-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KCaKwSctGmHrAAAu9opvQ
	(envelope-from <linux-aspeed+bounces-3668-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 Mar 2026 00:21:40 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A0028AA8B
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 Mar 2026 00:21:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fXgV14yZyz3cHH;
	Sat, 14 Mar 2026 10:21:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773444089;
	cv=none; b=Ib+Rty4PAMaq3Og0wJ01jRI6p4uy8+vqh1lTh6e1lOqfEYxTEZ2XFdbXqHVA2isWAQL5O4bDezL3/mRTuWzxjmvBp99saZieWF0LJ1Cd95uD+3J8NuWVB+QhOnD7dPwQJHL0m7rQTZ/501wWxutr0upslBRwb+wQ5dxwlB7BmjK8BywhTQctWSoSyHTwS/6mYLyDvIn0SMFa7596BI/avsrTlKLG3CgyeeEdJ+Oeq976WIbk/VQxW7n0Lbui5hvN0RGWxln5/uk9zniGGGoLmRkUICcl9Mufw5XyMTSlM1QTcy4B4ZuhvuK1nPF9Q5sfRxTc4UAFomNZqh+ByZBG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773444089; c=relaxed/relaxed;
	bh=GpaoXKN/PhCDZbMULkXq5SI6iDryty02Pl6Bw8fIN34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWo6XYUEdgfjqzKkEX0J0E5g7vRNaqiVGtPuPtxMx/f2PNF/aSeZpdBCDu+In/rbVfHy20J07zooESD6sJItbeU3QcWd60A0MzCiCmkWNpepK1CiqIN7spfhbm6hOAAigYhTHEE0xW/vN8XiJIGWL1ziQCAXvppNa7kFO1lD4b54Ej7fJy6g+F5ACQX2HG57GZ9Z0LS4dVW9rJa5C23z/fgTN8QTOwIFd/gGhZadrMIkA2W0sEto8VwJN4s66XHEXc+UuS7JOpc84FSMrwkcM7ppRoaVMupkR2xtSnmXzSC52kRCE4MD4lNE0Hf9jVO75xHJ95e/CdiI5RCWZwPJlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CUA3BHEN; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CUA3BHEN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fXgV06sCYz3bt1;
	Sat, 14 Mar 2026 10:21:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17EB7435E7;
	Fri, 13 Mar 2026 23:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0F5C19421;
	Fri, 13 Mar 2026 23:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773444087;
	bh=K0MwS09dQ1FesouGXSEQMZwoJn+bXck8mb7B9eGY9PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CUA3BHENTCO2/8OpmA3fhIz4IpKY34WfNmtQuCpCcMZWtzNE54vhGCjTdx9AX+zFl
	 a0rjFZG33yC1qgp80l/Gb4AQodxRLwDMV7gu1kfjvdu916/jGRmk81bll8octDidUm
	 PqPhCWBmsgpmzNgHa3oVOvA4ZYLuEVkXhJb9MNS6dv8k0KHb/Ygiit1OP72nEVch85
	 pzh7f2mZ7r6SKN6qPAxubHSs9pwxpYQjdH2wWxfNMgPm5xTUVMUEFielRF6yktLTGk
	 6KYpxSlliMHhj6Zu0bD9/0ftA5JF0RbNE2s7n59C2iFSJoQLXW3APjj+J8FuIRvx50
	 gMbzlcF6SwfyQ==
Date: Fri, 13 Mar 2026 18:21:25 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: jk@codeconstruct.com.au, andriy.shevchenko@linux.intel.com,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v26 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
Message-ID: <20260313232125.GA3618633-robh@kernel.org>
References: <20260309-upstream_i2c-v26-0-5fedcff8ffe8@aspeedtech.com>
 <20260309-upstream_i2c-v26-2-5fedcff8ffe8@aspeedtech.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-upstream_i2c-v26-2-5fedcff8ffe8@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-3668-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email]
X-Rspamd-Queue-Id: A2A0028AA8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 09, 2026 at 02:53:53PM +0800, Ryan Chen wrote:
> The AST2600 I2C controller supports three transfer modes (byte, buffer,
> DMA). Add "aspeed,transfer-mode" so DT can select the preferred transfer
> method per controller instance. Also add the "aspeed,global-regs"
> phandle to reference the AST2600 global registers syscon/regmap used by
> the controller.
> 
> These properties apply only to the AST2600 binding and are not part of
> the legacy binding, which uses a mixed controller/target register layout
> and does not have the split register blocks or these new configuration
> registers. Legacy DTs remain unchanged.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../bindings/i2c/aspeed,ast2600-i2c.yaml           | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> index de2c359037da..323e4f9b290a 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> @@ -37,6 +37,33 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  aspeed,transfer-mode:
> +    description: |
> +      ASPEED ast2600 platform equipped with 16 I2C controllers each i2c controller
> +      have 1 byte transfer buffer(byte mode), 32 bytes buffer(buffer mode), and
> +      share a DMA engine.
> +      Select I2C transfer mode for this controller. Supported values are:
> +        - "byte": Use 1 byte for i2c transmit (1-byte buffer).
> +        - "buffer": Use buffer (32-byte buffer) for i2c transmit. (default)
> +                    Better performance then byte mode.

Good, I like worse performance so I can use byte mode.

> +        - "dma": Each controller DMA mode is shared DMA engine. The AST2600 SoC
> +                 provides a single DMA engine shared for 16 I2C controllers,
> +                 so only a limited number of controllers can use DMA simultaneously.
> +                 Therefore, the DTS must explicitly assign which controllers are
> +                 configured to use DMA.
> +      On AST2600, each controller supports all three modes.
> +      If not specified, buffer mode is used by default.
> +    enum:
> +      - byte
> +      - buffer
> +      - dma

This is not required, so what is the default mode? If there's a default, 
you don't need the default value in the first place as the default is 
the property omitted.

> +
> +  aspeed,global-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle reference to the i2c global syscon node, containing the
> +      SoC-common i2c register set.
> +
>  required:
>    - reg
>    - compatible
> @@ -59,4 +86,6 @@ examples:
>          resets = <&syscon ASPEED_RESET_I2C>;
>          clock-frequency = <100000>;
>          interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +        aspeed,global-regs = <&i2c_global>;
> +        aspeed,transfer-mode = "buffer";
>      };
> 
> -- 
> 2.34.1
> 

