Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE92168C70A
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Feb 2023 20:49:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9cKt5FWlz3cMx
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Feb 2023 06:49:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.176; helo=mail-oi1-f176.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9cKp5HCdz306Y
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Feb 2023 06:49:48 +1100 (AEDT)
Received: by mail-oi1-f176.google.com with SMTP id p185so10720895oif.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Feb 2023 11:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J6lVgx9Ye+fXVcDPZBAErXqmuGkKzZYMKhQaRCupxvo=;
        b=DGB4d0Hkh/ZBMv3R0tpjg4dVLMcTxS4q8uTw7axvdGXCQxrumabba9bgdRfXt6S1Qt
         YtHNBV4X8rjliEsYW6GzI7XFsipOv3xCzSH3csAzGsCVK98HnBY5o+oYXKnh8vkM+a70
         rcBo736aB0xyrayDyEDTMQVksjc3eVBcsDh1XVZ1L4j3aK1kJ2s9Gh0JvSKFfc82QTuB
         6KI3TL+twiLIWEyAEtQssADMJIlk/tdyqK3YKi8mQgxwcuu5SB1OsijG1AmBRA12cGnB
         G4hrQD+tn0v4HXfAN0+dvQIeCeIz9JGwgiAtEDcjl6+HUUYhElvhhCtj6A2fkaiQju5x
         vhtw==
X-Gm-Message-State: AO0yUKV0ngxFjpdrSROIjtElkkrTCoypTreCqJ+Nvlwumz1IBZ0TuOlA
	pCZy6xKnl7DCeJKmKMDBDQ==
X-Google-Smtp-Source: AK7set8aa786WtgYsb0fgpCCASQHkwkCjX54JwJnRI/IbL+r96zPJmsJPnE+9mqzFfAISnFuKDdNjw==
X-Received: by 2002:aca:5ec4:0:b0:378:90b7:b28 with SMTP id s187-20020aca5ec4000000b0037890b70b28mr10237783oib.3.1675712985174;
        Mon, 06 Feb 2023 11:49:45 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r184-20020aca44c1000000b003786e78f2b5sm4615151oia.9.2023.02.06.11.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 11:49:44 -0800 (PST)
Received: (nullmailer pid 1206434 invoked by uid 1000);
	Mon, 06 Feb 2023 19:49:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Vijaya Anand <sunrockers8@gmail.com>
In-Reply-To: <20230206153325.43692-1-sunrockers8@gmail.com>
References: <20230206153325.43692-1-sunrockers8@gmail.com>
Message-Id: <167571291763.1202238.8557252319537323407.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings : misc : aspeed,cvic interrupt controller
 : convert the binding document to yaml
Date: Mon, 06 Feb 2023 13:49:44 -0600
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Mon, 06 Feb 2023 21:03:09 +0530, Vijaya Anand wrote:
>     Convert the binding document for ASPEED AST2400 and AST2500 coprocessor interrupt controller
>     from txt to yaml so one could validate dt-entries correctly and any future additions can go
>     into yaml format. The options for compatability described according to the example given.
> ---
>  .../devicetree/bindings/misc/aspeed,cvic.txt  | 35 ----------
>  .../devicetree/bindings/misc/aspeed,cvic.yaml | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/misc/aspeed,cvic.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/aspeed,cvic.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/misc/aspeed,cvic.yaml:23:111: [warning] line too long (123 > 110 characters) (line-length)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230206153325.43692-1-sunrockers8@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

