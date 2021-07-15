Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC7D3CA4AA
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Jul 2021 19:43:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQhZ33xXSz3004
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Jul 2021 03:43:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.180;
 helo=mail-il1-f180.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQhYx3krxz2yM7
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Jul 2021 03:43:47 +1000 (AEST)
Received: by mail-il1-f180.google.com with SMTP id b6so5725643iln.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Jul 2021 10:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eJvBNVIbt4HGtOUd1eE/GFLNbukv56MIw2CIkqxy0xM=;
 b=Kgk1pJ6QDrt+5wqO7FZzLLa0k5v6Tk8lnekKiZtJIqgaBj3mBMK6SK8EloEuHSTrxi
 XIokuBL3y8BQXuulDCNd+XuZ6XExYIfk6XG2pROFa2eWK6GpEB1z6eh+vZ/ny5/g5SAH
 EhPqsI+Jbk7UsNks0n9XVLhdx0kVNEnszXm32RLSGn8SyCOnI3TlfUVqSO3MFeAWGCnq
 +sH+91mS/IEegNe7dGbny7MruhlMOgNbGJYV9iv+Mgu/X/3sWmlm6QAA62f065pVff6j
 GVlYRWH/osvVIBXMoLyKNdKFnhHhn0+S8yOYu3Dzwpm/5WLF0n1MX1SPYkMvhmgGtLft
 xkcw==
X-Gm-Message-State: AOAM53109VhqglSSqGq7PPKBzZMbj7p0cRCxfNYYAJmGILqj7ikk7PTX
 +U5zHiv49ilSqMUsTX3X8g==
X-Google-Smtp-Source: ABdhPJyUCaDwlujyrWqGxamEcOBQBh/mEVhjQMODh+aCT6OUUAmS+sAvZKgCichuIqty/y4GGWAqLg==
X-Received: by 2002:a05:6e02:1b8f:: with SMTP id
 h15mr3426922ili.151.1626371025179; 
 Thu, 15 Jul 2021 10:43:45 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id w1sm3056450ilv.59.2021.07.15.10.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 10:43:42 -0700 (PDT)
Received: (nullmailer pid 1309176 invoked by uid 1000);
 Thu, 15 Jul 2021 17:43:39 -0000
Date: Thu, 15 Jul 2021 11:43:39 -0600
From: Rob Herring <robh@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v5 3/3] bindings: ipmi: Add binding for SSIF BMC driver
Message-ID: <20210715174339.GA1309142@robh.at.kernel.org>
References: <20210714033833.11640-1-quan@os.amperecomputing.com>
 <20210714033833.11640-4-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714033833.11640-4-quan@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, Corey Minyard <minyard@acm.org>,
 linux-aspeed@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 14 Jul 2021 10:38:33 +0700, Quan Nguyen wrote:
> Add device tree binding document for the SSIF BMC driver.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v5:
>   + None
> 
> v4:
>   + Fix warning with dt_binding_check [Rob]
>   + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml [Quan]
> 
> v3:
>   + Switched to use DT schema format [Rob]
> 
> v2:
>   + None
> 
>  .../devicetree/bindings/ipmi/ssif-bmc.yaml    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
