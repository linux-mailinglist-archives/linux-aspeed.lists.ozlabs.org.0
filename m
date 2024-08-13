Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E48950126
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Aug 2024 11:26:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QWvZq02D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjmH52kkWz2xKQ
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Aug 2024 19:26:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QWvZq02D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjmGy6vjHz2xKQ
	for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Aug 2024 19:26:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD2CA61363;
	Tue, 13 Aug 2024 09:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F1CC4AF09;
	Tue, 13 Aug 2024 09:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723541192;
	bh=NSzsztjiA9iy3UQR7+ew34K14a/ro09VqScy6tDCXKk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=QWvZq02DqjnOJ8grMe/TvFnytAuJca5DVG9WRx1yEcrcQ1RX5FRZZqPtZzzbDa936
	 8l22+Vqig7fwaTjtkJQOGW6B7ZetdBgbrAP1O9wISlPCGMBXrj8R0NH6uUXDvrQ6iG
	 HS6jfqdTsbH9jSlzcwIanIpyCDu29XNUKUYE+jspQC96gYz63apMMSmAck4c0E7jKM
	 TEN5IJtNkeXh+S4N8a4qwVlT1Ph+KbLbHorGBZ5m62LwsxuYjDk7k+90qEh5+KHrkE
	 Fw4qR+LfR69M1QNjEwRzpQNooVYXugiLxICb3hqDfAQLYxQGGGgiDagL38fI6txIZC
	 E5G1D9Oznapkw==
Date: Tue, 13 Aug 2024 03:26:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kevin Chen <kevin_chen@aspeedtech.com>
In-Reply-To: <20240813074338.969883-2-kevin_chen@aspeedtech.com>
References: <20240813074338.969883-1-kevin_chen@aspeedtech.com>
 <20240813074338.969883-2-kevin_chen@aspeedtech.com>
Message-Id: <172354119091.52485.8216967911640529962.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: interrupt-controller: Add support
 for ASPEED AST27XX INTC
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, andrew@codeconstruct.com.au, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Tue, 13 Aug 2024 15:43:37 +0800, Kevin Chen wrote:
> The ASPEED AST27XX interrupt controller(INTC) combines 32 interrupt
> sources into 1 interrupt into GIC from CPU die to CPU die.
> The INTC design contains soc0_intc and soc1_intc module doing hand shake
> between CPU die and IO die INTC.
> 
> In soc0_intc11, each bit represent 1 GIC_SPI interrupt from soc1_intcX.
> In soc1_intcX, each bit represent 1 device interrupt in IO die.
> 
> By soc1_intcX in IO die, AST27XX INTC combines 32 interrupt sources to
> 1 interrupt source in soc0_intc11 in CPU die, which achieve the
> interrupt passing between the different die in AST27XX.
> ---
>  .../aspeed,ast2700-intc.yaml                  | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml:24:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml:25:11: [warning] wrong indentation: expected 12 but found 10 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml: 'example' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240813074338.969883-2-kevin_chen@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

