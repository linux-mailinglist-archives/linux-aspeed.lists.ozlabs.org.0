Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D0089B1C
	for <lists+linux-aspeed@lfdr.de>; Mon, 12 Aug 2019 12:15:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466Wtw6zn0zDqXP
	for <lists+linux-aspeed@lfdr.de>; Mon, 12 Aug 2019 20:15:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=lee.jones@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="JR4azrcf"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466Wtp4KhyzDqWG
 for <linux-aspeed@lists.ozlabs.org>; Mon, 12 Aug 2019 20:15:11 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id z11so2117309wrt.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 12 Aug 2019 03:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=MIUyKFqvrV6Iriy5J++Bt5lmEJciQ4Nm0oLpNRJua4s=;
 b=JR4azrcfAINC79q/jxAC5q7wpl2GKtG+oqSduyMfzGNi7MCwG1x0vzQwWE5XWnUsqn
 4rvq0ZyF2vO73A1od36hoy/HlgAwsQvByuaSCf7qgoFk0pOoRmactaeJq+N5rrNr4nL0
 sMHmT+JJqQs1y47xUz0okyakzzuIzsZIQGoTNgr4MGMcXjg3SNLTpn0uQpJpePxfemI4
 eB9TFJRJdK0BAqRd3cOv4t3yykDlaiC8dePribs8TWaAdBtswdtwqoRGP8NGraDpCip6
 8mqPQZISI27VYMKq3Sw4FiBoVw8kpXQ/RGpijePMRLwvuqDyia8ETir7eum49Jot7nAU
 gSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=MIUyKFqvrV6Iriy5J++Bt5lmEJciQ4Nm0oLpNRJua4s=;
 b=gkFBqeqCfKyMzScv4WptAk2heLhH+AyCpdi7yDx/Gz+Jmgn7LyfJdr9QDP1Bp/4ipI
 TcpNmzFxsaajNfpnpMUKRiGEasS+nVMU1A58huBsQee8Wq8nbMOks9JjePMFGWI2F+AH
 mGGJrxlI4KuLmnMZh1YFSVy2Jso9mraHEApVdCTXrXpLPQ4McJ7yggLD0V0Yd3gISp/y
 eCpfyBu3yk8YbMq1VZoQWhSGnYprK4w79C444Pbh/x0+cyUU6ovYX7rMRdKHjrcRnL6S
 /t/ncwz+7cmIRfq1eijfXBF8RvrWgX36rM3U8fnsSsHtF18hWYLRhLGQMfYTiaRGuCUg
 9f/A==
X-Gm-Message-State: APjAAAVMUWgX17RMye+79BS0IiUvfOda0w6PnWMDSmEZb5X3bPQB3Fau
 K/nDZLDn0K0MuK4ApxP5VDw7dQ==
X-Google-Smtp-Source: APXvYqz48A5YFBe5piSydrG0TZ+rpOGZ4/18TlUR5pdHjlvP/9aDOmhZiCfxMVH17iE2WGkbx8bxMw==
X-Received: by 2002:adf:f042:: with SMTP id t2mr39835533wro.139.1565604906881; 
 Mon, 12 Aug 2019 03:15:06 -0700 (PDT)
Received: from dell ([2.27.35.255])
 by smtp.gmail.com with ESMTPSA id d17sm14629320wrm.52.2019.08.12.03.15.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Aug 2019 03:15:06 -0700 (PDT)
Date: Mon, 12 Aug 2019 11:15:04 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] dt-bindings: aspeed: Remove mention of deprecated
 compatibles
Message-ID: <20190812101504.GF26727@dell>
References: <20190724081313.12934-1-andrew@aj.id.au>
 <20190724081313.12934-4-andrew@aj.id.au>
 <CACRpkdZCJWeZO6CFvkq4uhnX+o_q_AfkDZ=a2kmUgbS3JtDqfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZCJWeZO6CFvkq4uhnX+o_q_AfkDZ=a2kmUgbS3JtDqfA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 05 Aug 2019, Linus Walleij wrote:

> On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > Guide readers away from using the aspeed,g[45].* compatible patterns.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> Patch applied to the pinctrl tree.

With my Ack?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
