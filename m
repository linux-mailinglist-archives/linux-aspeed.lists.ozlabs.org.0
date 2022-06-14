Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EC554BCE7
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Jun 2022 23:41:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LN2276pbpz3c5C
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Jun 2022 07:41:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.174; helo=mail-il1-f174.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LN2212Ymsz3brk
	for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Jun 2022 07:41:27 +1000 (AEST)
Received: by mail-il1-f174.google.com with SMTP id a15so7531580ilq.12
        for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Jun 2022 14:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P/snQ/WMRmumIJEZaYOGe+qZw9rf1ibk1Zx2Cluh3eE=;
        b=LjT0NpL12syOigiwDw3yhlgRP+m17P3ry8sU/3oFFpFXxwzz+OKJpRHwo5jy6o6f/R
         9Am0zjPDs/1U1vikZc3eglQGYW6nBVS0p3W+WNkbT2p6cr//HRelhs0MliaxCDw5Nex1
         UpYwyu5ISn5mbMb09lIzqimFNRo02S+w4lt+x/wS2T9moybdO1OSP3c3xKNv/HwMtUiM
         3QetFSrNkwHlwyd2pV/EDuwfgu4Fzjk3Rc0SNNwYM3YG0Q6OJcaP/DVO1lI0Fj8IzUzU
         Po/f7LhgzonHAxtR4OQ4Xz+OkQ5BNYcqIMiBefdQag3hHP0pedQAsNLACH2BWqB632v3
         BxNQ==
X-Gm-Message-State: AJIora++IvxKiU1AXGijsYEwhVFqqBaLk3tsxte1ulaT1H+6M/JSOQ1v
	Vjfq4YiL9BYIUp1JwRdbtQ==
X-Google-Smtp-Source: AGRyM1snG5pU4M/G6iIKIUmFJVbwBn2Ae094R8NI4RwTUrqihx5I7ujinRYO6C0+lzgFNAsFXyGYhA==
X-Received: by 2002:a92:c568:0:b0:2d3:da8d:76cc with SMTP id b8-20020a92c568000000b002d3da8d76ccmr4134740ilj.161.1655242883879;
        Tue, 14 Jun 2022 14:41:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id b3-20020a029a03000000b0032ead96ee5csm5316779jal.165.2022.06.14.14.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 14:41:23 -0700 (PDT)
Received: (nullmailer pid 2706027 invoked by uid 1000);
	Tue, 14 Jun 2022 21:41:21 -0000
Date: Tue, 14 Jun 2022 15:41:21 -0600
From: Rob Herring <robh@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: aspeed-i2c: add properties for
 setting i2c clock duty cycle
Message-ID: <20220614214121.GA2705772-robh@kernel.org>
References: <20220610054722.32229-1-potin.lai.pt@gmail.com>
 <20220610054722.32229-3-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610054722.32229-3-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Rob Herring <robh+dt@kernel.org>, Rayn Chen <rayn_chen@aspeedtech.com>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jun 2022 13:47:22 +0800, Potin Lai wrote:
> Introduce a new property for setting a minimum duty cycle for clock high.
> 
> * i2c-clk-high-min-percent: a minimum percentage of clock high
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
