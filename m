Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC726213E
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Sep 2020 22:37:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmH5g49BczDqSF
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Sep 2020 06:37:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.195;
 helo=mail-il1-f195.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmH5Z4QShzDqQN
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Sep 2020 06:37:34 +1000 (AEST)
Received: by mail-il1-f195.google.com with SMTP id x2so245502ilm.0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Sep 2020 13:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GEO2mEwTa2BqylVAGWSbETeCOTUBRxw5/MLADpDOoGg=;
 b=DNC/MaDZrRv8SFTx48+J8SxzUPe1x0VljfLvMh+dUrH1IJLz0JZcYWaMnBEp0+Pegi
 u6lhu3IdbO2w74fAkb6EB+AjTthaTFdgrMjy6xkK7kJIKBxfG0r3dwkNi5WF9NnZvkDd
 WhQUm5SpYte1sVWbTx8LtxuFCSW1HMYmMhPO2IZpAV629ECYy2+fNBLJqIao4lFUdQ1w
 rdhVhonOzlTJF7MDhVs/V4yNBzJRnmyvD0yLNJFDd+zSj0N+A8Ox54TK2rh9CTLO5mqc
 RmB9a7467MZ4J9TZLeTltUCcyWQSwbLy8vWBsHOYJKL1/+srkeRBUq0PiGsEiKLkSKXj
 lPFA==
X-Gm-Message-State: AOAM530s3h7Iyiu8d1+HpXalNgmpd+eBSxYTulHS9ZerxZ81NFMdjA4i
 Vh1zG9kAHWWCnHVAun0Q4w==
X-Google-Smtp-Source: ABdhPJw+t2qU979+AdZ8QjmxDAMMoLlZmNZjcpVp7EYdD0LSdmcKy9B0J62qeIINYSFwU668Ssd4nw==
X-Received: by 2002:a92:6a0c:: with SMTP id f12mr501711ilc.213.1599597451673; 
 Tue, 08 Sep 2020 13:37:31 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id m15sm215036iow.9.2020.09.08.13.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 13:37:31 -0700 (PDT)
Received: (nullmailer pid 875163 invoked by uid 1000);
 Tue, 08 Sep 2020 20:37:29 -0000
Date: Tue, 8 Sep 2020 14:37:29 -0600
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 1/5] dt-bindings: input: Add documentation for IBM
 Operation Panel
Message-ID: <20200908203729.GA872283@bogus>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-2-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820161152.22751-2-eajames@linux.ibm.com>
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
 dmitry.torokhov@gmail.com, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Aug 20, 2020 at 11:11:48AM -0500, Eddie James wrote:
> Document the bindings for the IBM Operation Panel, which provides
> a simple interface to control a server. It has a display and three
> buttons.
> Also update MAINTAINERS for the new file.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
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

additionalProperties: false

With that added,

Reviewed-by: Rob Herring <robh@kernel.org>
