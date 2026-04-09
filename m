Return-Path: <linux-aspeed+bounces-3879-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDGkLOpW12kFMggAu9opvQ
	(envelope-from <linux-aspeed+bounces-3879-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Apr 2026 09:36:10 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944AC3C7184
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Apr 2026 09:36:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4frs6C6Ckrz2yVt;
	Thu, 09 Apr 2026 17:30:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775719827;
	cv=none; b=RDT746Vev5Anp4C5i4DIZE2N821DZmRqJvZ9vbYkXVM5T5KOU2GYA8twNJSml4tcfGPF5skGpdSegsop0O5UYMe7Nq1uPmaDwtAgIoyDGD41Jx4ya8LqOWb/4SA3fvVMW0Ytag/hvfIQyVHhTsuP7kF5Cx2/aeR60RY9vJDsT7SWKRlsY5XXUgof1z4yCs0PlPtL7g15nPRoeHXcvw+eOm2E0dbAzJEWQeip48P7XnjziyKmoVA77+MG8qvV0v0KKvUcxSR1+NEewNH/IMKemT4CG9Db08FjGInHEN/PQRg/Rx1E8WoCGe/BtyvK+f81l4Bg2lW7lkCY9mrfihi4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775719827; c=relaxed/relaxed;
	bh=BT4K2Zf/nxxoglAtguOwCkdFi7MIc2xLvXbL9RRrrX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpYepLiiSTyoMV2tLOOqo6pOZ49ZNZLvQwoZq/027YHenjEKBy5a+LBYPnsqgDsfuOeCxyj1JnmA0mwkqhBQ3g/R+K3Nn5XyH0H1Unevs4DMxIsKR4uNxDSYUfqWJfYe19cUsr+H8V1CLvTLMCLDjc4OBDqL0cF9E2Wc4BfwnZ2ew+736h/3gd4VGXXKZw1heBhEapNvv4qus1+ZJqrc22hk5mI6YRhYhXEFRjUFKrsNVfhZZZ38kxgoSVfYL9SwASqhfnYcvSyRHCU1xeqsSWwrbj+ZB5g1Gm48kk6s7T7X+NS0KICDOeGDtghSPi1R4gqLqFAS/tUXsgTPzbTS9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ubxdOzey; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ubxdOzey;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4frs6C1GgSz2xTh
	for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Apr 2026 17:30:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2443D600AD;
	Thu,  9 Apr 2026 07:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4827EC4CEF7;
	Thu,  9 Apr 2026 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775719824;
	bh=vwghWor8OZe17SmQaOpkWmuy9YBmg+3I3XnkIV/bOig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubxdOzeyBTj+xJL5QphQ13nGFi9Y7uZlWAPeqOQVhIbTssTm5eLVRQfZGM0zCNBP2
	 CuRqfybrbijyPd2NCt9JaXYmSRYiI+ObSkFP89QOPazz6ZKGRlwC2BRRg2LiIaUaUZ
	 vArBk2OpZRCUFWnWxD69y3CShwa7If0gChD47f9b59ibWotr1kowXE7gOoXaP96ymj
	 54R8bO/ZzzCjyDS9y8Rz+ge2M0HXiDnncQGdtibon+vRkHEb4oU3l/o8DpRgUrUWHc
	 D8dbVIw99xyu5lXojtVjYkysEKG+/bjMk4o1ND4HSjv200ODdMIcbC6ixGTeiVhdRs
	 2NXKxf8/6xyoA==
Date: Thu, 9 Apr 2026 09:30:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Maciej Lawniczak <maciej.lawniczak@intel.com>, 
	Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/3] ARM: dts: aspeed-g6: Add nodes for i3c controllers
Message-ID: <20260409-massive-natural-crayfish-c1cf2f@quoll>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
 <51c4bdc02b45f67a0e32610a228091e137c135a6.1775679285.git.dawid.glazik@linux.intel.com>
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
In-Reply-To: <51c4bdc02b45f67a0e32610a228091e137c135a6.1775679285.git.dawid.glazik@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-3879-lists,linux-aspeed=lfdr.de];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dawid.glazik@linux.intel.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-aspeed@lists.ozlabs.org,m:linux-i3c@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:Frank.Li@nxp.com,m:maciej.lawniczak@intel.com,m:jk@codeconstruct.com.au,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	NEURAL_SPAM(0.00)[0.995];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,intel.com:email,codeconstruct.com.au:email,0.0.0.0:email,0.0.3.32:email,devicetree-specification.readthedocs.io:url]
X-Rspamd-Queue-Id: 944AC3C7184
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 10:34:34PM +0200, Dawid Glazik wrote:
> Add the i3c controller devices to the ast2600 g6 common dts. We add all
> 6 busses to the common g6 definition, but leave disabled through the
> status property, to be enabled per-platform.
> 
> Originally-by: Jeremy Kerr <jk@codeconstruct.com.au>

Don't invent tags. This is not used outside of TIP.

> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
> v3:
>  - add i3c aliases
>  - rebase on top of latest tree and solve conflicts
>  - as agreed with Jeremy off-list, he said I can take authorship of this going forward
> v2:
>  - use inline bus representation, without the i3c: label
> ---
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 97 +++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index f5641128614f..f986fcbed604 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -29,6 +29,12 @@ aliases {
>  		i2c13 = &i2c13;
>  		i2c14 = &i2c14;
>  		i2c15 = &i2c15;
> +		i3c0 = &i3c0;
> +		i3c1 = &i3c1;
> +		i3c2 = &i3c2;
> +		i3c3 = &i3c3;
> +		i3c4 = &i3c4;
> +		i3c5 = &i3c5;

Bus aliases are not properties of SoC DTSI.

>  		serial0 = &uart1;
>  		serial1 = &uart2;
>  		serial2 = &uart3;
> @@ -1066,6 +1072,97 @@ i2c15: i2c@800 {
>  				};
>  			};
>  
> +			bus@1e7a0000 {
> +				compatible = "simple-bus";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0 0x1e7a0000 0x8000>;
> +
> +				i3c_global: i3c-global@0 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Best regards,
Krzysztof


