Return-Path: <linux-aspeed+bounces-4452-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LMhvM+lhT2pyfgIAu9opvQ
	(envelope-from <linux-aspeed+bounces-4452-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Jul 2026 10:55:05 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D46D172E899
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Jul 2026 10:55:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Ev/MX5jc";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4452-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4452-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwpgp3xK9z3c9w;
	Thu, 09 Jul 2026 18:55:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783587302;
	cv=none; b=m/zXgnHrE9optK0YsL7zUTyB9eKNpKeoToo8GG0ExvOvY8/2sptaTKXkeOcD9rUoQVmEh+l8zxsWxPKe3JvRCFKg4LLN6fIO5bBxqhn7mxhrn9hiCbTZLbPw+JIvkSRzyNnRiDXnen64fBzY/ynKodDCjXO0mY9IUFTfT/LLgakrqlXEsdvThcTMAguyfcq4Np/4/UzkYbXyI/TMTqkwPKdA+R7ITVn3Qur0kMzM5JmONty+PbBwUh4+LndrxDEJC8wVynK57EJO4PO4AGlfjFYCoxKFxsqlA3Z2bFDPK3L0w8GOGFpg0JQ3Q2BVRI7k3SMcb/hUvCMSBVNlFnvVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783587302; c=relaxed/relaxed;
	bh=E+NtRvec8F8aekKuz6iezeEslYswvJ60lH8RuxMxcZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2S1PrOTo897ACiy+x40VwELi7L3q63qyM5UUhK+P2PnS5hOQEcGKAMzpcEJzezPlhwWLVF6nihMR6PJJbJrLbPI94qv7nyc2JRXAbKVGPWL9DrLe8LnL2pXXIgryqC88XTQye8wuR18cTPoeHqXyb9JFx3c6/mqnMiWbRs1t/uTvaskMbTvz61yTC70u5Vb6Dx9kGf1vTHEKE7Q2mLeFzrHbAh7V52O7tIehXdwCDsYoQaXnHzlsiNNVMxnYCBqikDZ6erHehqjszhLsNGpvf/5KnS1Imri0cGu3I3hWO8C0Ek5auWhiyRh3k+cbozL4mRZ91MuygHgumFWuBNehA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ev/MX5jc; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwpgn46F4z3byT
	for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Jul 2026 18:55:01 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B656243F84;
	Thu,  9 Jul 2026 08:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2D41F0155C;
	Thu,  9 Jul 2026 08:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587297;
	bh=E+NtRvec8F8aekKuz6iezeEslYswvJ60lH8RuxMxcZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ev/MX5jc/Q/G6Qw04KbVPZw5mRQE+925mjjdbilnfAAOVJNfB1vqvULVLTCS81vKk
	 wN2ytgPlflg25QwFvcSP2Mv0/Og4TU7H5c3xEcu8NHXE2ECgL5+5plo48ZJQVghFzF
	 ARE7QFfwFhP2oxWPJQtYxV8h4ax//Sd33HlQF2Bo5rtU+5NcVs10Z9Cev8yw3fQhzM
	 74/hC6VBgPCPGTR9nk/d7uzrDgXFSYvRHsdwaKfU4yNLh06rO1EPX2L5jhL+ypVDGJ
	 d3Hgo4aJ7/3SoluWgBzvIxxhHBj0j/dKNRgKt+m0jpCu4Y9TGMHVfy4bB/NJB0jyl8
	 5sg4Dq9ZRwf1A==
Date: Thu, 9 Jul 2026 10:54:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?R3LDqWdvaXJl?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: serial: 8250: aspeed: add
 aspeed,vuart-over-pci bool prop
Message-ID: <20260709-shaggy-discreet-dodo-e5ffbb@quoll>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <501428d6a6cb1548bf357c25313dbc319724ead2.1783524645.git.gregoire.layet@9elements.com>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <501428d6a6cb1548bf357c25313dbc319724ead2.1783524645.git.gregoire.layet@9elements.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4452-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregoire.layet@9elements.com,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:lkundrak@v3.sk,m:devicetree@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew@lunn.ch,m:jacky_chou@aspeedtech.com,m:yh_chung@aspeedtech.com,m:ninad@linux.ibm.com,m:anirudhsriniv@gmail.com,m:linux-serial@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[jms.id.au,codeconstruct.com.au,v3.sk,vger.kernel.org,linuxfoundation.org,kernel.org,lunn.ch,aspeedtech.com,linux.ibm.com,gmail.com,lists.ozlabs.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:from_smtp,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,9elements.com:email,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D46D172E899

On Wed, Jul 08, 2026 at 03:35:54PM +0000, Gr=C3=A9goire Layet wrote:
> The ASPEED AST2600 has 2 Virtual UARTs accessible over PCI.
> The ASPEED AST2600 can be used as a PCI device.
> 2 Virtual UART can be exposed to the host via this PCI device.
> These are 8250-compatible register sets and can be used to have UART
> communication between the PCI BMC and the host.
>=20
> This boolean can be set to specify if a VUART is used over PCI. A VUART
> over PCI needs a syscon phandle. The syscon gives a regmap to the SCU,
> which is used to set the enable bits of the PCI device.
> On the aspeed's chips, the clocks phandle already points at the SCU node.
> But deriving the regmap from the clock provider would misuse the clocks
> binding. An explicit syscon phandle states the dependency directly.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> ---
>  .../devicetree/bindings/serial/8250.yaml      | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documen=
tation/devicetree/bindings/serial/8250.yaml
> index 8f22121381fc..2ea8981bba80 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -27,6 +27,16 @@ allOf:
>              enum:
>                - aspeed,ast2500-vuart
>                - aspeed,ast2600-vuart
> +  - if:
> +      required:
> +        - aspeed,vuart-over-pci
> +    then:
> +      required:
> +        - syscon
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-vuart

else:
=2E..
disallow new properties (see example-schema)

>    - if:
>        properties:
>          compatible:
> @@ -223,6 +233,12 @@ properties:
>            - const: uartclk
>            - const: reg
> =20
> +  syscon:

That's explicitly forbidden by writing bindings (and mentioned as the
antipattern in my older talks about DT).

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the SCU syscon, used to enable the VUART over the BMC P=
CI
> +      device. Only applicable to aspeed,ast2600-vuart.
> +
>    dmas:
>      minItems: 1
>      maxItems: 4
> @@ -316,6 +332,12 @@ properties:
>        polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH). Only
>        applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
> =20
> +  aspeed,vuart-over-pci:
> +    type: boolean
> +    description:
> +      Enable the VUART over the BMC PCI device. Only applicable to
> +      aspeed,ast2600-vuart.
> +
>  required:
>    - reg
>    - interrupts
> --=20
> 2.54.0
>=20

