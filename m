Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4667935FDA1
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Apr 2021 00:16:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLGyW1Cnnz30Fw
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Apr 2021 08:16:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.44; helo=mail-ot1-f44.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLGyS1gWpz2ysp
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Apr 2021 08:15:57 +1000 (AEST)
Received: by mail-ot1-f44.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so20793906otk.5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Apr 2021 15:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F07gtHUJwY/w7iuYzdTNfY1HnMAu4hugjUa0Lgoy7/U=;
 b=qsbDQyAr+FLFByJYZiww5tWSl7f4ryt4AymO9y3kMhjtKX1q/WzggZI01ISj8znuWJ
 f33hrF/PJbIaIWhZcOb6LZ9uCSGd4GVolUXdRdpyfidsw23Z1q3nnrJmRue8RRVC9Dgz
 lPAaqXqU28ejOX5By+UellnSSZb9rfP7ytEOUubPHRLMA+P1W1C4OJ1avaZjidSzBjRA
 HkbPND6QypzZAp7Fg3wdjOBzQiArEbYAA4QLZAP+Qf0FtjyGHrE0dOi1nWtAZxxnqJzd
 zHlccL8qYRS3wyUM7t1Vg7NM/Idt8zCTbRogo4XADk7La5uBbPaKvtNjlBroTIFZdsNU
 0rsg==
X-Gm-Message-State: AOAM531PywjIFWkvPmWfATzV7FL/R5EKS7Ta014TBTarbugLRBdKbTx7
 Adq+n3gEUFLWrSBMH1D8vbF9f4QozA==
X-Google-Smtp-Source: ABdhPJwQ/l5ePXdK2531ARA8Lyb1Lw/ISWyLZmahs26BmVT5HGe9aezzG+AecBIPDpM7O6nek5tzSQ==
X-Received: by 2002:a9d:4911:: with SMTP id e17mr223342otf.38.1618438555210;
 Wed, 14 Apr 2021 15:15:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o2sm205446oti.30.2021.04.14.15.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 15:15:54 -0700 (PDT)
Received: (nullmailer pid 63091 invoked by uid 1000);
 Wed, 14 Apr 2021 22:15:53 -0000
Date: Wed, 14 Apr 2021 17:15:53 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v2 1/2] dt-bindings: Add bindings for aspeed pwm-tach and pwm.
Message-ID: <20210414221553.GA56046@robh.at.kernel.org>
References: <20210414104939.1093-1-billy_tsai@aspeedtech.com>
 <20210414104939.1093-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414104939.1093-2-billy_tsai@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-pwm@vger.kernel.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, p.zabel@pengutronix.de,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Apr 14, 2021 at 06:49:38PM +0800, Billy Tsai wrote:
> This patch adds device bindings for aspeed pwm-tach device which is a
> multi-function device include pwn and tach function and pwm device which
> should be the sub-node of pwm-tach device.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Change-Id: I18d9dea14c3a04e1b7e38ffecd49d45917b9b545

Drop

> ---
>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 60 +++++++++++++++++++
>  .../bindings/pwm/aspeed,ast2600-pwm.yaml      | 44 ++++++++++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
>  create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
> new file mode 100644
> index 000000000000..eaf8bdf8d44e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 ASPEED, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/aspeed,ast2600-pwm-tach.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PWM Tach controller Device Tree Bindings
> +
> +description: |
> +  The PWM Tach controller is represented as a multi-function device which
> +  includes:
> +    PWM
> +    Tach

But is it really? A PWM and tach sounds like a fan controller. Look at 
other existing PWM+tach bindings we have for fans.

> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,ast2600-pwm-tach
> +      - const: syscon
> +      - const: simple-mfd
> +  reg:
> +    maxItems: 1
> +  "#address-cells":
> +    const: 1
> +  "#size-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties:
> +  type: object

As you know the 2 node names, they should be documented. However, see 
below.

> +
> +examples:
> +  - |
> +    pwm_tach: pwm_tach@1e610000 {
> +      compatible = "aspeed,ast2600-pwm-tach", "syscon", "simple-mfd";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      reg = <0x1e610000 0x100>;
> +
> +      pwm: pwm@0 {
> +        compatible = "aspeed,ast2600-pwm";
> +        #pwm-cells = <3>;
> +        reg = <0x0 0x100>;
> +      };
> +
> +      tach: tach@1 {
> +        compatible = "aspeed,ast2600-tach";
> +        reg = <0x0 0x100>;

You have 2 nodes at the same address. Not valid.

> +      };

There's no real need for 2 child nodes. The parent node can be a PWM 
provider.

> +    };
> diff --git a/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml b/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
> new file mode 100644
> index 000000000000..97923e68ccb9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 ASPEED, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/aspeed,ast2600-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2600 PWM controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |
> +  The ASPEED PWM controller can support upto 16 PWM outputs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-pwm
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +  reg:
> +    maxItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // The PWM should be a subnode of a "aspeed,ast2600-pwm-tach" compatible
> +    // node.
> +    pwm_tach: pwm_tach@1e610000 {
> +      compatible = "aspeed,ast2600-pwm-tach", "syscon", "simple-mfd";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      reg = <0x1e610000 0x100>;
> +
> +      pwm: pwm@0 {
> +        compatible = "aspeed,ast2600-pwm";
> +        #pwm-cells = <3>;
> +        reg = <0x0 0x100>;
> +      };
> +    };
> -- 
> 2.25.1
> 
