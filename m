Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 129A32587CF
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Sep 2020 08:02:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgc0Z1QkYzDqNf
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Sep 2020 16:02:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=EyFbK6eF; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgc0M58wtzDqSd
 for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Sep 2020 16:01:55 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id d26so11686882ejr.1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 31 Aug 2020 23:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EkupweJqHLfmFCxLHqeG68vNKrHPfrtIjt4kzmPcnsI=;
 b=EyFbK6eF8UZibuQKO0GC9NV71maFJP6Lk1Amk++dT0OGoetZLaE5FVeFT89z08eGzl
 f1A1cfzS6GKc8Cer9n4YrPL6GEjN02/ul1cZdv2y5G8EcfxqJIjRnUb6WJgO5ji7nIOg
 dSiB0q/ear5rjcGRSl54tmtYIBNfyS9v5FTNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EkupweJqHLfmFCxLHqeG68vNKrHPfrtIjt4kzmPcnsI=;
 b=cU6sJ7NBOSb7qe6qBvgMi8uV2m2sha7tK4Id8EdtZGPeSGIt5Tn3K+pDjRMc3ifePV
 EDvMcnIvgfA4CrtbEN+vGOeZYVlHGJuLHJe5cq0tFURkgfvJd46s1zL3bawubAu+HdFS
 qjm8iFyN21etpAWB7U5XHBb2rp4uxESRV1JY/3ABh18q93BwEBQMCj5r3i8xrrfpfphA
 GKf051MYyCxxmA1yK5ZD4sUCX40waZAq11PUS3p3GI5aHSITEkQ2fAJH5m2qmZMw8WRL
 pbrGdvKPjwjOVFoROLgZx/GbxlHedwtN7sgKYdLOHKHbKpwzVW4IKUa9/WRLe+j67lxc
 6sGg==
X-Gm-Message-State: AOAM531ZCNojM8xiUV+cVptTysYS0/EY4Ntm6VpnNawUXqtSMkofEr1P
 B0EH/2sCEpub4zkJgjAiAUyncqar1EWLv+UCxMU=
X-Google-Smtp-Source: ABdhPJwfJvRaHnwieIAyxhCfgXEjfwjIFQEZOY8ooA0sW1prdZMe1Dgnswd09o3V5KVBKldbrjWf7uszgsVtQBqTa+o=
X-Received: by 2002:a17:906:8401:: with SMTP id n1mr76455ejx.215.1598940112575; 
 Mon, 31 Aug 2020 23:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-2-eajames@linux.ibm.com>
In-Reply-To: <20200820161152.22751-2-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Sep 2020 06:01:39 +0000
Message-ID: <CACPK8Xe6CWgs555t_TCkwv2fZ9Aev9bFH6P8dHYnp9u6Pt0dVg@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: input: Add documentation for IBM
 Operation Panel
To: Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, dmitry.torokhov@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 20 Aug 2020 at 16:12, Eddie James <eajames@linux.ibm.com> wrote:
>
> Document the bindings for the IBM Operation Panel, which provides
> a simple interface to control a server. It has a display and three
> buttons.
> Also update MAINTAINERS for the new file.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../bindings/input/ibm,op-panel.yaml          | 38 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/ibm,op-panel.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/ibm,op-panel.yaml b/Documentation/devicetree/bindings/input/ibm,op-panel.yaml
> new file mode 100644
> index 000000000000..86a32e8f3ef0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/ibm,op-panel.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/ibm,op-panel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IBM Operation Panel
> +
> +maintainers:
> +  - Eddie James <eajames@linux.ibm.com>
> +
> +description: |
> +  The IBM Operation Panel provides a simple interface to control the connected
> +  server. It has a display and three buttons: two directional arrows and one
> +  'Enter' button.
> +
> +properties:
> +  compatible:
> +    const: ibm,op-panel
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ibm-op-panel@62 {
> +            compatible = "ibm,op-panel";
> +            reg = <0x40000062>; /* I2C_OWN_SLAVE_ADDRESS */
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ac79fdbdf8d0..a9fd08e9cd54 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8278,6 +8278,12 @@ T:       git git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git
>  F:     Documentation/ia64/
>  F:     arch/ia64/
>
> +IBM Operation Panel Input Driver
> +M:     Eddie James <eajames@linux.ibm.com>
> +L:     linux-input@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/input/ibm,op-panel.yaml
> +
>  IBM Power 842 compression accelerator
>  M:     Haren Myneni <haren@us.ibm.com>
>  S:     Supported
> --
> 2.26.2
>
