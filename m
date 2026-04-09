Return-Path: <linux-aspeed+bounces-3878-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KA6COtW12kFMggAu9opvQ
	(envelope-from <linux-aspeed+bounces-3878-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Apr 2026 09:36:11 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9844B3C7185
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Apr 2026 09:36:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4frs3q0dYPz2ySj;
	Thu, 09 Apr 2026 17:28:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775719702;
	cv=none; b=SsPKaLZ6PwncIKr4QOAMyyyJ9VQ62Ju9Fh+6J+VpMC+rmdbq6NIiJjxb6MhZ8zs+opJ0H5zLH5eZVU0akaJBC8ceBp3m/I8vLd/d4biN+rfD+EW3hBVl5Hw9a89VkRuWKlWyeFcIROU3brrU26WxYTEhqENZIeSixyVMBvk2n35WH7b5vollU7BMee8Ejc7eqBGZnDbfFp2FcngOCzLqNHnvl1qOsUkkbHN/ZNDE5tHb/jWU4qCFeUREA0O+hbAcrHGQXcTfjyphu4I2klwoQN5PqZc66BB9QnsZV6+tfDOZhgLw4qU1e0kGOPbW9zqs8Dg/dRPjFrlRuCprH50FLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775719702; c=relaxed/relaxed;
	bh=613UmsT+jTo54xaDw1cFmp5OdRZv/pKg1pFcm53tXes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHa2egxUhrN6OGn/zKglgI4E0P6o0tTLKAxzZeUI8d8O4/TIfh0f+uj8wMDqJCRZZPqTyFORLk75VlDI3XNNxHQB1gtxUuh2aiUJJrKWDcjNNJ8/w7eeUnkzlPdSQtXl/C31mTPtQu2ftyiedT+RDayqT6IQxVbiCzBGW+UhdcU9yopetuAHInOMI9LtQaPbY61udx8BWL212u582iGz2nicZd7oHS9CUh4nWjHTJPl5WQtoXiGHsiBzgTLgTLn7Uu2dU86HYPa16BdFy1XUZKoUsohiORx7xEAl5QsBlB7OCsgvS2H7TM1HEMSw/heJe6BnROviqQgp1/AoE7blPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FloQYJ2c; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FloQYJ2c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4frs3p0ZXcz2xTh
	for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Apr 2026 17:28:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C837144186;
	Thu,  9 Apr 2026 07:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B795C4CEF7;
	Thu,  9 Apr 2026 07:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775719699;
	bh=wGp8rio3+O1LigJl7XJ1TouzLqDBv3x6HJpnWI0/Ifg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FloQYJ2c5SgdHHvn1NdU1cHQSeYqeBynECzDyAjAy4b8FuIRjOkBM61yBgn4oUO3Y
	 knFq4qkQ0jAh/fq362EBXQ0nOWCgPyzxNwhnGsStS1gamecAmV6RB8QW+THelaMIrR
	 brnznsxZ1n1LZxCs48N2fZ/PTWmsEVBN5s1ebZNIKH0tZ2nh3DKN0myG4THk15I32t
	 qQiTrEYS5ZlrcJCzE1FcMDfby2vKslWs0GbHHanWLLXyq2bR4xEQzLOLr2MsaCNPLp
	 cG7Aowyj1makyC//P3Cwy+gQiCeRbeg3An5LVouCxbVbxuLrUnBXkimPNOcWkN2w/Z
	 D8O0+qZIPG7dg==
Date: Thu, 9 Apr 2026 09:28:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Maciej Lawniczak <maciej.lawniczak@intel.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: i3c: Add AST2600 I3C global registers
Message-ID: <20260409-beneficial-sociable-tamarin-dbcaeb@quoll>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
 <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [5.29 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3878-lists,linux-aspeed=lfdr.de];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:dawid.glazik@linux.intel.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-aspeed@lists.ozlabs.org,m:linux-i3c@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:Frank.Li@nxp.com,m:maciej.lawniczak@intel.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	R_SPF_ALLOW(0.00)[+ip6:2404:9400:21b9:f100::1:c];
	ARC_ALLOW(0.00)[lists.ozlabs.org:s=201707:i=1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.996];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 9844B3C7185
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 10:34:35PM +0200, Dawid Glazik wrote:
> Introduce the device-tree bindings for I3C global registers found on
> AST2600 SoCs.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
> I wasn't sure if I should add newline at the end of the
> file or not so I took
> https://github.com/torvalds/linux/tree/master/Documentation/devicetree/bindings/i3c
> as an example.

Answer is: you cannot have patch warnings.

Documentation/devicetree/bindings/i3c does not have patch warning, does
it?

> ---
>  .../i3c/aspeed,ast2600-i3c-global.yaml        | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
> new file mode 100644
> index 000000000000..edecc18796a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/aspeed,ast2600-i3c-global.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2600 I3C Global Registers
> +
> +description: |
> +  The AST2600 SoC provides a shared I3C global register block used by all
> +  I3C controller instances. This block contains per-instance global

Why are you adding syscon to I3C controllers? Only I3C controllers go
to i3c directory.

syscons go soc.



> +  configuration fields, including controller instance ID and SDA pull-up
> +  configuration.
> +  Each I3C controller references this syscon node through the
> +  aspeed,global-regs property.
> +
> +maintainers:
> +  - Dawid Glazik <dawid.glazik@linux.intel.com>
> +
> +allOf:
> +  - $ref: /schemas/mfd/syscon-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: aspeed,ast2600-i3c-global
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +

I do not see any differences against syscon.yaml binding. Why do you
need separate file? Look first how other platforms do it.

> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    bus@1e7a0000 {
> +        compatible = "simple-bus";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0x1e7a0000 0x8000>;

Drop entire node, not needed.

> +
> +        i3c-global@0 {
> +            compatible = "aspeed,ast2600-i3c-global", "syscon";
> +            reg = <0x0 0x1000>;
> +            resets = <&syscon ASPEED_RESET_I3C_DMA>;
> +        };
> +    };
> +...
> \ No newline at end of file

Patch warning.

Best regards,
Krzysztof


