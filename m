Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FCD785E4C
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Aug 2023 19:10:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fPAdYWHF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWCQY5cxyz3dJ4
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Aug 2023 03:10:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fPAdYWHF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=yznc=ei=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWCPr1hsPz3fZr
	for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Aug 2023 03:09:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C661C62384;
	Wed, 23 Aug 2023 17:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7589BC433CB;
	Wed, 23 Aug 2023 17:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692810589;
	bh=WPvAkPh8AunP/lNvri8BRVfUDHESTWdheGKzVZNfuQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fPAdYWHFcJSmlFRtEquy4q0hkIj/keX9dvaPI0fAzpFs9SMJmKHM1W+0C5kRbp13D
	 v0JGKX3SEbbiz5WqGUM+xjrfgotZPHwn7blD2aaY+/GqExIh8/d+9wyMpKWM9MbUFh
	 gYc2jPggM7x5EXaMgM1jt/g9cT0da2qTs5lvVHpOT82i2nUSHKH2EkmoRHH0cRqTkj
	 0UH7SBcH3rTAkU/lRdp4DN79JjzrKQ1mZd9R3yDM4iy70Z2pdCxBxkOO6XrXF9jFng
	 ociCJI6PouPtW40u+HDSIIE/tT4bVSj/v/p4jAXYIJcTebZ54Wf4HAShtfQP72leid
	 rovrzf3dsQtRA==
Received: (nullmailer pid 2496484 invoked by uid 1000);
	Wed, 23 Aug 2023 17:09:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: peteryin <peteryin.openbmc@gmail.com>
In-Reply-To: <20230823160810.1067102-1-peteryin.openbmc@gmail.com>
References: <20230823160810.1067102-1-peteryin.openbmc@gmail.com>
Message-Id: <169281058628.2496450.12875634767226591718.robh@kernel.org>
Subject: Re: [PATCH] Title: Select GPIO command source.
Date: Wed, 23 Aug 2023 12:09:46 -0500
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, peteryin <peter.yin@quantatw.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Thu, 24 Aug 2023 00:08:10 +0800, peteryin wrote:
> From: peteryin <peter.yin@quantatw.com>
> 
> Description:
>   The capability to choose the GPIO command source
> between ARM LPC and Coprocessor CPU is supported.
> 
> Test Plan:
> Get Bank gpio command source
>   e.g.
>   cd /sys/bus/platform/drivers/aspeed-command-source/
>   cat 1e780000.gpio-command-source/bank_abcd
>   ARM ARM ARM ARM
> 
> Set Bank gpio command source.
>   e.g.
>   cd /sys/bus/platform/drivers/aspeed-command-source/
> 
>   echo "A ARM" > 1e780000.gpio-command-source/bank_abcd
>   or
>   echo "A LPC" > 1e780000.gpio-command-source/bank_abcd
>   or$
>   echo "A COP" > 1e780000.gpio-command-source/bank_abcd
> 
> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
> ---
>  .../sysfs-driver-aspeed-gpio-command-source   |  24 ++
>  .../soc/aspeed/gpio-command-source.yaml       |  58 ++++
>  drivers/soc/aspeed/Kconfig                    |   9 +
>  drivers/soc/aspeed/Makefile                   |   1 +
>  drivers/soc/aspeed/aspeed-command-source.c    | 266 ++++++++++++++++++
>  5 files changed, 358 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-aspeed-gpio-command-source
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/gpio-command-source.yaml
>  create mode 100644 drivers/soc/aspeed/aspeed-command-source.c
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/soc/aspeed/gpio-command-source.yaml:38:3: [error] syntax error: expected <block end>, but found '?' (syntax)
./Documentation/devicetree/bindings/soc/aspeed/gpio-command-source.yaml:39:6: [error] missing starting space in comment (comments)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/soc/aspeed/gpio-command-source.example.dts'
Documentation/devicetree/bindings/soc/aspeed/gpio-command-source.yaml:38:3: expected <block end>, but found '?'
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/soc/aspeed/gpio-command-source.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/soc/aspeed/gpio-command-source.yaml:38:3: expected <block end>, but found '?'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/aspeed/gpio-command-source.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1500: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230823160810.1067102-1-peteryin.openbmc@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

