Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44272776F07
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 06:19:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rLsEVYtq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLtxM12Jxz3c8n
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 14:19:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rLsEVYtq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=zxi7=d3=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLtxH1bsZz3bh5
	for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 14:19:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D86C76430C;
	Thu, 10 Aug 2023 04:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA18C433C7;
	Thu, 10 Aug 2023 04:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691641182;
	bh=trUtC0Ikk+qyjql4cASs+vqY8v7RGTje0N0Sl0etRKE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rLsEVYtqJJfycHjuKzSpk/LAbdPlIegAUN+6+p/fZ8eZDkkGegr+dqfVf8VuKPxfv
	 i4n7lNwguD2HmbLtKg9rfrB7jVqSP3TXzf1LPmwcoDdbPHZqYz7zdjwmYWDwOnf6c9
	 TKgBBRTSFFQ90WLrnriF9G16yru2GxfzSfrQgbmf3QsHgOcBl1ONcUesCU/dNbH07t
	 bmM+QST1mx+UmHRjLFdZoTTmj4bek6R71EhWT11tJAAfNd7ZsgtH+TAxA+abAT/XAT
	 El3P+5sYq632pZXzeheGk1y9tc8PW6Vv816dGhEqDuPx0q4I+I0j8MaBLiqr86iyyV
	 yuoELXgQdWTyA==
Received: (nullmailer pid 3618888 invoked by uid 1000);
	Thu, 10 Aug 2023 04:19:40 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20230810034421.742166-2-Delphine_CC_Chiu@wiwynn.com>
References: <20230810034421.742166-1-Delphine_CC_Chiu@wiwynn.com>
 <20230810034421.742166-2-Delphine_CC_Chiu@wiwynn.com>
Message-Id: <169164117998.3618854.8025888421725054954.robh@kernel.org>
Subject: Re: [PATCH v8 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite
 4 board
Date: Wed, 09 Aug 2023 22:19:40 -0600
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


On Thu, 10 Aug 2023 11:44:18 +0800, Delphine CC Chiu wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230810034421.742166-2-Delphine_CC_Chiu@wiwynn.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

