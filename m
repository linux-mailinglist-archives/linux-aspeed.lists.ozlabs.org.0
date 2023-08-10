Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E0C77712E
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 09:20:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z7z/k9nx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLyxy4NX0z3c3s
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 17:20:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z7z/k9nx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=zxi7=d3=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLyxp3NVGz2ytZ
	for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 17:20:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6714B63EB8;
	Thu, 10 Aug 2023 07:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE94C433C9;
	Thu, 10 Aug 2023 07:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691652025;
	bh=GGJchB0pjs96Duv9owBAcUnHzqV80CzKCVLMP1q2peM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z7z/k9nx9Ma1bhr6Wu6cmraIcVPwvNtJSQXSuKJxjhhbbcqG811Tu85dD7DdwCgo2
	 mDEFrpbYpA/pd3/B4vgE/RnoPf1k3KqGtkccldKiL0RuBvcvwI5S4pHoCLUGfjXJ7a
	 yqMhKudi9HW3YzuQkJSml3kDoeQ8KHiQkxpQElDpYHHAu7a/EHDybLLVeUe2v5obcd
	 /vwtFAwAopq5u+svcZYdbioIR53POw2qLP34eww139WHdQgknJnqxWTwoU3c+lt0wW
	 GWJwUPVflu1CPSTc/PjwRr2tlPzZ4g9LZu2WDug8uPI2SK3pY74a3uFUTK+zsig3Kl
	 GA1jNDWxQ0oxA==
Received: (nullmailer pid 3911839 invoked by uid 1000);
	Thu, 10 Aug 2023 07:20:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20230810070032.335161-2-Delphine_CC_Chiu@wiwynn.com>
References: <20230810070032.335161-1-Delphine_CC_Chiu@wiwynn.com>
 <20230810070032.335161-2-Delphine_CC_Chiu@wiwynn.com>
Message-Id: <169165202180.3911788.1110313008758620193.robh@kernel.org>
Subject: Re: [PATCH v9 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite
 4 board
Date: Thu, 10 Aug 2023 01:20:21 -0600
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Thu, 10 Aug 2023 15:00:29 +0800, Delphine CC Chiu wrote:
> Document the new compatibles used on Facebook Yosemite 4.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changelog:
> v7 - Revise changelog format
> v6 - Change project name from yosemitev4 to yosemite4
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230810070032.335161-2-Delphine_CC_Chiu@wiwynn.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

