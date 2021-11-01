Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFBF442143
	for <lists+linux-aspeed@lfdr.de>; Mon,  1 Nov 2021 21:02:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjkTD21b4z2yPM
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 07:02:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.174;
 helo=mail-oi1-f174.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjkT54lnbz2xt9
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Nov 2021 07:01:59 +1100 (AEDT)
Received: by mail-oi1-f174.google.com with SMTP id o83so26583879oif.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Nov 2021 13:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vKbU3K+WrEp4o3QSdl7uJ5u0m9E6kBLDNmgHPy+kDDM=;
 b=NxUtX2WjO+e75eJhxZF27HErKH4CY0GzS81foHJDmf3qy/hKNfQbvW/gYTC6F43CGX
 O5/3c6HSTTXQG7Oe2I+95O6OLJcj/ayxK5X7bbs5baJokhc8Pgx7GgGiZssVXhboRYaG
 eg5EAUqSCCy1fTP9pfW5qaTKt9yEb3b6wuEtLapp1oC9AyYnJSIDLv8SexZfcuAqQC0c
 a3Wc1cAGTowgl2Rvu6WvkTSURM6aXyzKU0XNXnE21IN+dfKMfd1VS9jTPUYDjvOYbJK2
 C4U+7mVPE16eQcny2oRfUQY5L0fh2YbJy2mhh6UwQhbNWT7RN+eqCwkLLlkhcO899HZy
 bd6w==
X-Gm-Message-State: AOAM532D7ye8bZIVuIjTzYjn6zCszpdm1WVopAaAOShZZgXfy5s1atmV
 b/6jQrFE1eDwovKkiP3xgQ==
X-Google-Smtp-Source: ABdhPJzu9huACWQR3JSRs6TW0bAUKDyIXz9rtmEFdctQS4TyLEu9YE4GVHGZhVUykEvaSkqL5HdO7w==
X-Received: by 2002:a05:6808:2201:: with SMTP id
 bd1mr1004520oib.73.1635796917384; 
 Mon, 01 Nov 2021 13:01:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g15sm4551923oiy.8.2021.11.01.13.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 13:01:56 -0700 (PDT)
Received: (nullmailer pid 943361 invoked by uid 1000);
 Mon, 01 Nov 2021 20:01:55 -0000
Date: Mon, 1 Nov 2021 15:01:55 -0500
From: Rob Herring <robh@kernel.org>
To: tommy-huang <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH 4/4] dt-bindings: gpu: Add ASPEED GFX bindings document
Message-ID: <YYBHsy3Ed3Ss9281@robh.at.kernel.org>
References: <20211101110107.29010-1-tommy_huang@aspeedtech.com>
 <20211101110107.29010-5-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101110107.29010-5-tommy_huang@aspeedtech.com>
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
 BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, robh+dt@kernel.org,
 daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 01 Nov 2021 19:01:07 +0800, tommy-huang wrote:
> Add ast2600-gfx description for gfx driver.
> 
> Signed-off-by: tommy-huang <tommy_huang@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/gpu/aspeed-gfx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

