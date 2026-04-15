Return-Path: <linux-aspeed+bounces-3910-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zF1AN+cR4GllcQAAu9opvQ
	(envelope-from <linux-aspeed+bounces-3910-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Apr 2026 00:32:07 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B3F408AEA
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Apr 2026 00:32:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fwwqf1w2hz2xls;
	Thu, 16 Apr 2026 08:31:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776292318;
	cv=none; b=Ja7Btidwb3U4AbBOzy+OQ+92uPXEoGn6etF/KXXF2lI8rrTMAL/Vvyg5NZ5oiLseEzgxC2HPT7UIVnW+9/yf2BgUHhELvW53ewc1U8iPUJjGiemFIEsoqn+K+kBERKVDEDJWQ571DMfiD0y6Fu652OZ11Q5o5ikw7/FhwAz4kMyMzgkMxfu2H4HQQ8OhedyNFBsStftdK7tPghkQY7YY9oDc2HJ4uAGytpIsJVGU/tJi1x2DYJM7Ok9I1HTnPd+V2I4AW80Ci+ay8xebDKAip5HFdS4gT1o821tnXIckqN5uZbF4qT+ZzYGAdgeeWOnA1fLXYUpVPGHWN8DOIeqZPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776292318; c=relaxed/relaxed;
	bh=7o2D3wvzMntOCnPcrvsa+oxe8pjqXUltjCcehmZT1mg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RAs4nVixFaSeB8MPLGtlxvKpThMlHNUTod9QdypEgeBTmDtVtfvMFlDuKEtByWgxlZzfzj8PVyrsjXRauVc1LxQVtztd0W10SdEa4UXJzxzX3pSVktvbmXejO7MlWeSPI+pRjhF4GBRfoh2tJRRFNmKPYqAxolOXR3ACHd6VWwzQwN9BYq25kqKSAgoSSInUq1AXKPKt019WpF3pDT68pV7O/hqhr3U3Tp3XAM7V9iC3cmh8fkNIOz7ZwmW+7vShLcbo0+vT5rGKYvc0PAqDzitBX6BdfaVquMxC5Wf84hytdtR+jAXRvPbplsI1Z8QBOoQBuGOpaJ5jbhHD+HZ63Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RgPGHcG7; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RgPGHcG7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fwwqc5nG8z2xSF;
	Thu, 16 Apr 2026 08:31:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06BC360128;
	Wed, 15 Apr 2026 22:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A6BC19424;
	Wed, 15 Apr 2026 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776292313;
	bh=usjqRhUrHdefvg550NoYkdLrbpoiUwaN7du2pNz9Hfk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RgPGHcG7qAh3Bm8lSOD0W1RTlWds35ZM7iCvHAVan/F0bxi5KjXOn14BpCMHdLTYm
	 MnM1nW03Pq8s0gQLoZzGlLYk9YFR94+YdPqh1eI/zmMzkI4kvKbwNYK1WhY8gOQcSk
	 bImXyxcThqQ17u22HZLrtys2sZzNOmSYiHojjyziivyWExaAbK3bVYS0aoPLYEGzP3
	 YmdpuQ1BSjJByAnJVErMpOiLlQO6EhyX5YbHZNsGdGG0+skpFMsfRhFdsiTUyPUS5m
	 o3tikdeBqR56sbjiyt1e82q/CayP2M4xNeBK5EnJxIMZOjoeJ0KeMd7xJ3/jL6p1mM
	 P7udaw+Ph2+Vw==
Date: Wed, 15 Apr 2026 17:31:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Joel Stanley <joel@jms.id.au>, Conor Dooley <conor+dt@kernel.org>, 
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
 Andrew Jeffery <andrew@aj.id.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20260414-upstream_pinctrl-v6-1-709f2127da33@aspeedtech.com>
References: <20260414-upstream_pinctrl-v6-0-709f2127da33@aspeedtech.com>
 <20260414-upstream_pinctrl-v6-1-709f2127da33@aspeedtech.com>
Message-Id: <177629231003.934121.15016914373469082341.robh@kernel.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
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
	TAGGED_FROM(0.00)[bounces-3910-lists,linux-aspeed=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email,devicetree.org:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 88B3F408AEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 14 Apr 2026 17:38:59 +0800, Billy Tsai wrote:
> Add a device tree binding for the pin controller found in the
> ASPEED AST2700 SoC0.
> 
> The controller manages various peripheral functions such as eMMC, USB,
> VGA DDC, JTAG, and PCIe root complex signals.
> 
> Describe the AST2700 SoC0 pin controller using standard pin multiplexing
> and configuration properties.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 170 +++++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$:allOf:2: 'then' is a dependency of 'if'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$:allOf:2: 'then' is a dependency of 'else'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260414-upstream_pinctrl-v6-1-709f2127da33@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


