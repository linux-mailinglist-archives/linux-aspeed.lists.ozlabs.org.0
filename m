Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C44A84EB6E1
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 01:38:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSmGS2wSLz2yXP
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 10:38:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.46; helo=mail-oa1-f46.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSmGL2Bxsz2xYB
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 10:38:17 +1100 (AEDT)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-deb9295679so13207243fac.6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Mar 2022 16:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+1cAZLTqZFTwl/X7nyWvDSu6q8lZr9S0RABiAIxFkuM=;
 b=jrstKKXPL6e+G9EhwEcWi7ADBqPxjfRIiclWb0pKSguJ7RVh60dLhJPC6tu6a1xf9x
 lOGDvl8cBU2nL8dbIGVrKKy/RTJRLtWR2ftGaNEp0Ks3FgxTFOlrHtTI1/B8bbxyXg7o
 D55B3Jit355KUlNE5O7sWeHUNXMlpQG5WcEcZQsjmPvdt8CVs1xAjhdIEEG+n+/BRnrD
 QU1uQnxrlh3FVwL4R+mtJ046hNqq0AQAAKJRctUt1zC/PWptk6D51nDuTyT2tbJNQ0QL
 hjK9C/yaUrEeadmJo+IyltmiltOszv28FW238JBa2R11j9jPpfKxHuueiT48Kt09b5Ie
 JXdg==
X-Gm-Message-State: AOAM532iIO8uevbGrKgb2Ipl3yfS7PsLGrlM2/LRVo5RbzPlkpGqibNi
 EhLbWzSqwMAL/3rUyhTRqw==
X-Google-Smtp-Source: ABdhPJxkrGtgBbZuZzBG3H5iUHI4ZnV53mjbZvAZawZm3fbdUcidO+Lw9+Yu0tCay2j9wBItP2MuyQ==
X-Received: by 2002:a05:6870:d354:b0:dd:d425:d4de with SMTP id
 h20-20020a056870d35400b000ddd425d4demr922292oag.210.1648597094905; 
 Tue, 29 Mar 2022 16:38:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k22-20020a056830243600b005af5fb99326sm9382190ots.63.2022.03.29.16.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:38:14 -0700 (PDT)
Received: (nullmailer pid 1572927 invoked by uid 1000);
 Tue, 29 Mar 2022 23:38:13 -0000
Date: Tue, 29 Mar 2022 18:38:13 -0500
From: Rob Herring <robh@kernel.org>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: pinctrl: aspeed-g6: remove FWQSPID
 group
Message-ID: <YkOYZQQ2D4zuBspP@robh.at.kernel.org>
References: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
 <20220329173932.2588289-4-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329173932.2588289-4-quic_jaehyoo@quicinc.com>
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
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 Jamie Iles <quic_jiles@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 29 Mar 2022 10:39:28 -0700, Jae Hyun Yoo wrote:
> FWQSPID is not a group of FWSPID so remove it.
> 
> Fixes: 7488838f2315 ("dt-bindings: pinctrl: aspeed: Document AST2600 pinmux")
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
> Changes in v3:
>  * Newly added in v3. (Andrew)
> 
>  .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
