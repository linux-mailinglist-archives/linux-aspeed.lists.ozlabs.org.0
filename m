Return-Path: <linux-aspeed+bounces-428-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 484C1A096BD
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jan 2025 17:07:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV6463SPrz3cYh;
	Sat, 11 Jan 2025 03:07:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736525238;
	cv=none; b=GyHADKqXtzAlfUBtZ+BTO/Uw/Wif6y3ZmRj9PtL0hMnLbxBO0Pz9l98iPepdiAsWGExMcPDgjPFgwYVVY8HqABBsrWPcgXEyvOQuGb31ULLExulcHNvabMpik+UEvlKPy2H2+Ji1h5swfFI7mBPaZnumr9Po0eu1M0FvzwEgBUXbLsSSFCQj27Gu49oZUJ2mncjZWQ7kTXnq3qeix91SjkCVoMszOI0BFC5SIm4gqfFCpDUaXDJiqtgjAFF1w9syD3hUu7hDraO4mZCuQRLIH6GPNzVV90CkxqkiVmebDHZkZe/YQMRbnGK3wleCdF37folhe44C1BnOei38oGJcrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736525238; c=relaxed/relaxed;
	bh=Ix31C5pSpXY8k6w9TewnzNJ/TNiypBsPfJmPK8zNyhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/D1U4gSoAM51p2mHoBt3tSC3dxjuOn1wdVS8Mnqbka2x/PlnGEIo82PePgPNpcwLuneqK+USdwaodUyEy+CMzcqk7uLILNQ+HuMzevpC/9r7t7GRKlfq9JGfain4XOOfhYPCqIcGQlwqR6tmYo8mPJQMCKoyBRhwnfxPI3ni2qFAKadjyx/AjfEXkmuugNBRXfIkqGzy4UaXyTje2RSueZHO7t5JMPtf/1sAy3pVRyb+KJrrzT2mmQAqCksDsa/tBLSTKgkL4Y37gKVXjCeGCBbM3kjf71+Xxq+TXyD+OtAoKmBgZ/6WboWd+quE6uZDdWPor/XQQGVdU+kPUo1eA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I+9hpbaI; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I+9hpbaI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV6453fNcz2xrC
	for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Jan 2025 03:07:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C756CA425D5;
	Fri, 10 Jan 2025 16:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7E1C4CED6;
	Fri, 10 Jan 2025 16:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736525234;
	bh=8ic0fmAFCingqmiYWExc1+9H7U4At02apc1uatdqHJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+9hpbaIVj0FizWLBTAWdFSqcU/ByW3qkTkX6aDezSm2lBVzZd/sn0qs/9PXrA8Q4
	 idGoskoWOfDiMrR28hTdGd4EP4GR7tky/OOW0c2RmkLyfK0p4nEdSPYzJw5pUm7Jgs
	 6+BxOrKW86Yu76GQ+CkNNz9YIaoq7HDmT+0mT/1jrhlUPtZuImUsGli2KVgZDX6GrI
	 waLjYb0D5kB4O9yeG7i5fZOaHxy5BakYKOaVVr/ibq+qLFIMYwfLPVXfZ9OLLvWq0J
	 TjlUtV5r97UcbuTVykcU/CeIZKNX9FaGjzHpFrcxhWuLoBzIvHEoYuB7nKsmUZ+wr1
	 H3pRIN9+Xdmzw==
Date: Fri, 10 Jan 2025 10:07:13 -0600
From: Rob Herring <robh@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: minyard@acm.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, ratbert@faraday-tech.com,
	openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, eajames@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/10] bindings: ipmi: Add binding for IPMB device intf
Message-ID: <20250110160713.GA2952341-robh@kernel.org>
References: <20250108163640.1374680-1-ninad@linux.ibm.com>
 <20250108163640.1374680-3-ninad@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108163640.1374680-3-ninad@linux.ibm.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 08, 2025 at 10:36:30AM -0600, Ninad Palsule wrote:
> Add device tree binding document for the IPMB device interface.
> This device is already in use in both driver and .dts files.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  .../devicetree/bindings/ipmi/ipmb-dev.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> 
> diff --git a/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml b/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> new file mode 100644
> index 000000000000..a8f46f1b883e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ipmi/ipmb-dev.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IPMB Device
> +
> +description: IPMB Device interface to receive request and send response

IPMB is not defined anywhere.

Which side of the interface does this apply to? How do I know if I have 
an ipmb-dev?

This document needs to stand on its own. Bindings exist in a standalone 
tree without kernel drivers or docs.

> +
> +maintainers:
> +  - Ninad Palsule <ninad@linux.ibm.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ipmb-dev
> +
> +  reg:
> +    maxItems: 1
> +
> +  i2c-protocol:
> +    description:
> +      Use I2C block transfer instead of SMBUS block transfer.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ipmb-dev@10 {
> +            compatible = "ipmb-dev";
> +            reg = <0x10>;
> +            i2c-protocol;
> +        };
> +    };
> -- 
> 2.43.0
> 

