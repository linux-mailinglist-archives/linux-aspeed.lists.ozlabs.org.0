Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 275424EB6E3
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 01:38:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSmGr0lDJz2yXM
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 10:38:44 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.48; helo=mail-oa1-f48.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSmGn1rXCz2xXw
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 10:38:41 +1100 (AEDT)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so20470741fac.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Mar 2022 16:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xEbDKhTM7RQdvtoZuefpidK6ohyUKWmzenr9k2XEs3g=;
 b=bxvLBRSUzLrpAvdDsna+5APHXVZq8GnKSt40NSeC6s0G6mlQ6q9IB2Vn2astDohiWZ
 P3IKEksJ9ivrFfLL94WjhpEOgBEuA72ABCiS6BLa+T/MDcNCZAaxxTVytUgLuTUD3w2W
 VUP0mJxajePtiSQ5J29yasFrdBfn3ZmaOyhnVWlPEj+K+KgT/p/Rj10mKZ1pQZOtRuRz
 kWsoWqfAnUQPEWJ6xtn3Rj91mu2Ymmx1DviBHJd+sghHVlP4hudQ1fO3GH5qUDSDy3rR
 XOR3r0mb+/TEGJCd/5ug4hVoSoecEBBwxNb8KEX6r7Cj0cLgGgwLJ1TkROHxFov79WqJ
 5w8A==
X-Gm-Message-State: AOAM532sd/8VdEuNVDfNpU5UNnJArF2T4tZxxRkjKx5SpsntDtEY1Znw
 fGPPw5/lzKLOLPpQ4NaJMw==
X-Google-Smtp-Source: ABdhPJydeiR+F5HgC9pPbzwkK5Vdei7PaC3g+3TPi93gGleM5+RV/Tx2uHbBq1eI03+FtkplIpMMBA==
X-Received: by 2002:a05:6870:73cf:b0:de:cb67:56f7 with SMTP id
 a15-20020a05687073cf00b000decb6756f7mr945096oan.130.1648597118933; 
 Tue, 29 Mar 2022 16:38:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c9-20020a4a8ec9000000b0032438ba79b0sm9144966ool.0.2022.03.29.16.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:38:38 -0700 (PDT)
Received: (nullmailer pid 1573631 invoked by uid 1000);
 Tue, 29 Mar 2022 23:38:37 -0000
Date: Tue, 29 Mar 2022 18:38:37 -0500
From: Rob Herring <robh@kernel.org>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: Re: [PATCH v3 5/7] dt-bindings: pinctrl: aspeed-g6: add FWQSPI
 function/group
Message-ID: <YkOYfSArIo/LyawY@robh.at.kernel.org>
References: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
 <20220329173932.2588289-6-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329173932.2588289-6-quic_jaehyoo@quicinc.com>
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

On Tue, 29 Mar 2022 10:39:30 -0700, Jae Hyun Yoo wrote:
> Add FWQSPI function/group to support QSPI mode on the dedicated
> FWSPI interface.
> 
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
> Changes in v3:
>  * Newly added in v3. (Andrew)
> 
>  .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
