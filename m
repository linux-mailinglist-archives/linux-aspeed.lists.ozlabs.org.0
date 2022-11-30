Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 186CD63E2C6
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Nov 2022 22:31:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMsp405Nfz3bbY
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Dec 2022 08:31:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.46; helo=mail-ot1-f46.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMsny0R3sz303P
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Dec 2022 08:31:01 +1100 (AEDT)
Received: by mail-ot1-f46.google.com with SMTP id w26-20020a056830061a00b0066c320f5b49so12091342oti.5
        for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Nov 2022 13:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mc6V9+sDoG9Mki15v8P5KKA7NfsAq4SE0l5Qimb/jYw=;
        b=3U6n686QmOj3PlwSMwN695zLp06L9TXHka+OxB9fZRQAkmokq7o41OAaZ7dFjuqIUQ
         idvSiaJ8iOn6ZZmTEUdimborwyFUQryRoyGL1oM9DDjqfZ4VXrMY5Ky5xpuWdgMsWxu8
         S+7VQLnUzKZl2c8xz9uMien1uXC58Nc9VQ51SNzzIX3Be0OEOVrcCcr/hojJUcQyA/bq
         wuopE8ABpdUVXKQqgz14S4rouRXdIWYxhfOr+k4hiKCC0pXF01mhLj59AUBVoFar44bI
         iSZg/5+Si5DhG69Ly3NxUykHNNsEOqbp7mX5+aIGLqKuukgVuy9yYNIpU7h7AcPYKUfS
         Vtjw==
X-Gm-Message-State: ANoB5pkwqCK/GNRETpy4ycgHdWkpdVwbtWYfs98NAGLmme/mSM8FyUEq
	4CL4RKwoygv54g9WyF167Q==
X-Google-Smtp-Source: AA0mqf4vUPSR7ovZbOCRKRqMQN2EeuGVgLzCTx74Sseob1+HjZJNxvL9pC0HARrpgxgB7hYUbhdb3Q==
X-Received: by 2002:a05:6830:1688:b0:66c:42d7:7d70 with SMTP id k8-20020a056830168800b0066c42d77d70mr21118469otr.98.1669843858446;
        Wed, 30 Nov 2022 13:30:58 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u9-20020a056870f28900b0011bde9f5745sm1781162oap.23.2022.11.30.13.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 13:30:57 -0800 (PST)
Received: (nullmailer pid 2960995 invoked by uid 1000);
	Wed, 30 Nov 2022 21:30:57 -0000
Date: Wed, 30 Nov 2022 15:30:57 -0600
From: Rob Herring <robh@kernel.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: bus: add documentation for Aspeed
 AHBC
Message-ID: <20221130213057.GA2960216-robh@kernel.org>
References: <20221124105552.1006549-1-neal_liu@aspeedtech.com>
 <20221124105552.1006549-5-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221124105552.1006549-5-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Nov 24, 2022 at 06:55:52PM +0800, Neal Liu wrote:
> Add device tree binding documentation for the Aspeed
> Advanced High-Performance Bus (AHB) Controller.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  .../bindings/bus/aspeed,ast2600-ahbc.yaml     | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml b/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
> new file mode 100644
> index 000000000000..cf9740f2a0c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED Advanced High-Performance Bus Controller (AHBC) Device Tree Bindings

Drop " Device Tree Bindings"

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
