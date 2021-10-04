Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC6E42165B
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Oct 2021 20:24:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNTdz0r6jz2yYl
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Oct 2021 05:24:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.177;
 helo=mail-oi1-f177.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNTdw01LKz2yNQ
 for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Oct 2021 05:24:51 +1100 (AEDT)
Received: by mail-oi1-f177.google.com with SMTP id q16so22811853oiw.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 04 Oct 2021 11:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uqtsnyNKKJS9yEITd+jPQas/rw37SI2DxYEgJEPNXP8=;
 b=lPKOt6CH4bPHEPI/0AGloCHQrcObsNnhc9jdQJEsqBLmRzrJ7+3y/rAofhj5w+wBU2
 g4InB19MUuZKNWpb7GQJPx0Mqil6TIeG2XcuazuCfKX3mnWGiUtIYYWmRMkoWQgIzlD5
 6H9WMkoW0iWqKoaGbsLihZLK9I7b94V132rDWNPpQvmUmKx1cPgfZ2212/r9YUfKX6WO
 u+uO6emIMeSh1ur/q8HbYaZfI3t7DtXuiSbzB+podqRSZ4MsFSvP/k/UchYm8cTSvLEE
 rkReJAsB4zyYburITHt72azqVBAWJyBgfx03blpYza/kO5qwDWcisq7QXkGQc0gjT3Pa
 Snew==
X-Gm-Message-State: AOAM531O01CmxFO2ggz++gnsL0DfF9035ylxv7y5EqzL9tFC18ILIzAa
 M/524EecnT3F7bExcA9sAQ==
X-Google-Smtp-Source: ABdhPJyTyPZM+WOk9JYo2l4wBBPBqaBkwGZycQzvuQxp5B5a6aRmAyRc76soi8nj+CiRbzOQa0HtHQ==
X-Received: by 2002:a54:4d89:: with SMTP id y9mr4913473oix.22.1633371888817;
 Mon, 04 Oct 2021 11:24:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l28sm2928304oof.30.2021.10.04.11.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:24:48 -0700 (PDT)
Received: (nullmailer pid 1605963 invoked by uid 1000);
 Mon, 04 Oct 2021 18:24:47 -0000
Date: Mon, 4 Oct 2021 13:24:47 -0500
From: Rob Herring <robh@kernel.org>
To: tommy-huang <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH 6/6] dt-bindings: gpu: Add ASPEED GFX bindings document
Message-ID: <YVtG72uZKHrkGk6u@robh.at.kernel.org>
References: <20210928025703.10909-1-tommy_huang@aspeedtech.com>
 <20210928025703.10909-7-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928025703.10909-7-tommy_huang@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 28 Sep 2021 10:57:03 +0800, tommy-huang wrote:
> Add ast2600-gfx description for gfx driver.
> 
> Signed-off-by: tommy-huang <tommy_huang@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/gpu/aspeed-gfx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
