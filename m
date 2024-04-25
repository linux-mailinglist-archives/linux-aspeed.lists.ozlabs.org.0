Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8A88B2DAA
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 01:40:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=teblGcka;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQXQm6Lw2z3dkm
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 09:40:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=teblGcka;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQXQX6V9vz3cnt;
	Fri, 26 Apr 2024 09:40:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B0EFBCE1B46;
	Thu, 25 Apr 2024 23:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F17C32781;
	Thu, 25 Apr 2024 23:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714088401;
	bh=evdB63NMsMmGAiCN8AeT5XYZiSR91S9n0SCVkkG/xt0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=teblGckagfhS08PQPJ3BrF/9Xn5U38ispWYhbhqJbagfZ99kM/adIoZIA2Kqj098I
	 UBCSPmJtnGsjyX3XpboAtkP8phh40nHnJHcqLoS08tLoB7xPgcEhcpw/RU2wpGch0O
	 JY9avPFhRXgc/0wGSIUyhWrBuwjUJECwPoVUniTFihTu2g645MYpC2G0fJhrb4cKBG
	 8DyRNrsyRuL8Us0RLT+PyT+JSGG4JnjgGNYGEepNDdOJC5bXlAs5mGWY97UsIoap8K
	 LxPC6jdTAWdvzs+Sn5ft24sXz8m7V4X6DYm2pxsG7osNpfW0pcecW5IcA/oAoUtJcS
	 +pCqKkLWMzTDg==
Date: Thu, 25 Apr 2024 18:40:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20240425213701.655540-7-eajames@linux.ibm.com>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-7-eajames@linux.ibm.com>
Message-Id: <171408839666.3902693.1860621022882259895.robh@kernel.org>
Subject: Re: [PATCH v3 06/14] dt-bindings: fsi: Document the FSI controller
 common properties
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Thu, 25 Apr 2024 16:36:53 -0500, Eddie James wrote:
> Since there are multiple FSI controllers documented, the common
> properties should be documented separately and then referenced
> from the specific controller documentation.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../bindings/fsi/fsi-controller.yaml          | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/fsi-controller.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/fsi/fsi-controller.example.dtb: /example-0/fsi@3400: failed to match any schema with compatible: ['fsi-controller']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240425213701.655540-7-eajames@linux.ibm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

