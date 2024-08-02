Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB593945C29
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 12:29:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TAKDI/Zd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wb2BY560Wz3dX8
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 20:29:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TAKDI/Zd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wb2BS1f3Zz3cVd
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 20:29:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7D7B4CE18AF;
	Fri,  2 Aug 2024 10:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E96FC32782;
	Fri,  2 Aug 2024 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722594556;
	bh=CJCaoWSDIP5SJphz4ctyOagGF1RYe8/tBShRSLTdA+0=;
	h=Date:From:To:List-Id:Cc:In-Reply-To:References:Subject:From;
	b=TAKDI/ZdMZBJxxYq7r51GY2g44cAnqXZXvN1Hs1s7Nwby5EA7bYJUgznB95Rlb/xq
	 8b2/4pSbmtaCRkb9KaXsPGcZ5Rk8fxybxAwiW3+8uGiVUcqqvpZgALQk7w4gthY+DF
	 7HBgVUZDCmzuujMyjF+dCBzBFaCC8vs8U97mWYbHLNXoiV1r4TiJECnzbBg93r0heT
	 zZ5MPq+2TlV5rb9RV9xTWxOjptyqF0uVivg/LQP6Ab8GaH8d+U1tH4G4GloAGKvyrZ
	 Z2fXb96R3AlAcYb2psUgPzqd0/BbTi0m1EdAGw0yWSDmqQcxCo1CGPxS/Oz56j5jyE
	 PYW1C9Zl754jw==
Date: Fri, 02 Aug 2024 04:29:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kevin Chen <kevin_chen@aspeedtech.com>
In-Reply-To: <20240802090544.2741206-3-kevin_chen@aspeedtech.com>
References: <20240802090544.2741206-1-kevin_chen@aspeedtech.com>
 <20240802090544.2741206-3-kevin_chen@aspeedtech.com>
Message-Id: <172259455507.2558656.18344933444213909682.robh@kernel.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: mfd: aspeed,ast2x00-scu: Add
 ASPEED AST2700-SCUX schema
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
Cc: linux-aspeed@lists.ozlabs.org, catalin.marinas@arm.com, mturquette@baylibre.com, will@kernel.org, linux-clk@vger.kernel.org, m.szyprowski@samsung.com, quic_bjorande@quicinc.com, arnd@arndb.de, u-kumar1@ti.com, lee@kernel.org, geert+renesas@glider.be, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, conor+dt@kernel.org, nfraprado@collabora.com, olof@lixom.net, soc@kernel.org, linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, dmitry.baryshkov@linaro.org, krzk+dt@kernel.org, shawnguo@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Fri, 02 Aug 2024 17:05:36 +0800, Kevin Chen wrote:
> Add compatible for two SCU of SCU0 and SCU1 in AST2700.
> 
> Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml      | 70 +++++++++++++------
>  1 file changed, 50 insertions(+), 20 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: 'scu@ast2xx00-scu' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: 'scu@ast2xx00-scux' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: scu@ast2xx00-scu: Missing additionalProperties/unevaluatedProperties constraint
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: scu@ast2xx00-scux: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240802090544.2741206-3-kevin_chen@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

