Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B634A8B2DA7
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 01:40:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q8NJRlYV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQXQd55h5z3dWK
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 09:40:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q8NJRlYV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQXQV3bRBz3cnt;
	Fri, 26 Apr 2024 09:40:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50DD461D0B;
	Thu, 25 Apr 2024 23:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7D7C113CC;
	Thu, 25 Apr 2024 23:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714088399;
	bh=/oN2iGCiL+NicvCJAspV+Q8NPoc1Br/lYrDCPGBMVNM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Q8NJRlYVdYooFr1LJ/zQYNSD6DtJ+hQ5FyOs+/6W/ul3ud90x5zt6Ex1RbYGoZKV3
	 qukqvWj3AjRmAlVs0x6RbdfjulyPHFvJCcKppdTVfIL7ZnRUB8FhhOkpv8c+lwDg1q
	 IywI4SQ8AxQr3gtPN9Cc2b8e0grCqC11wf7zb7LXbHxOJ4Zrb5w40lRnNpWLR4kXjR
	 uZLkWrEKMZN9puXb0XDvWNXd/PCsRadQS9OT70dxVerVy/1IT70IZqn6v/Y2Cf5CAq
	 KSLOCn3d3botO3EfDUBR48FzAupB01ttVy8VqmXrc7DVrac4MHI/LyqwTlHvSXsqXx
	 vOz9P3QoGeSeA==
Date: Thu, 25 Apr 2024 18:39:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20240425213701.655540-2-eajames@linux.ibm.com>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-2-eajames@linux.ibm.com>
Message-Id: <171408839602.3902645.11975304379095234562.robh@kernel.org>
Subject: Re: [PATCH v3 01/14] dt-bindings: spi: Document the IBM Power SPI
 controller
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-fsi@lists.ozlabs.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Thu, 25 Apr 2024 16:36:48 -0500, Eddie James wrote:
> The IBM Power chips have a basic SPI controller. Document it.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../devicetree/bindings/spi/ibm,p10-spi.yaml  | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/ibm,p10-spi.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/ibm,p10-spi.example.dtb: fsi2spi@1c00: '#address-cells', '#size-cells', 'spi@0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240425213701.655540-2-eajames@linux.ibm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

