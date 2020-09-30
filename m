Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E973127EFAF
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Sep 2020 18:52:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1j410CqszDqVv
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Oct 2020 02:52:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=u3844wxg; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1j3q37VdzDqTb
 for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Oct 2020 02:52:37 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id o20so1549861pfp.11
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Sep 2020 09:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+YsaxwbfWVm9IFurTjwCUMxSyQutFwvjtbnnkumX19M=;
 b=u3844wxgYnVwyWa4w0p3mTTnwhl7Fw+TjOYFjmX8MhxYBMAaEM9uNfKf6g6gBgOoNW
 3k7VlSuh/pcMQ45YvtUQBGfjqAHwrAGVleWPcj40j7SiTTLTGBxdNMtpbJcqF+6cKwAK
 +CQ+mKiImaxtnB6+1j60FY6GdcZwR8zzLk2idGIM4nS7JEJQ2/IS9kQyrqR9qPBhYIXY
 MzcU0Vc4RcHFhFU/okXq+u2NJVMfqDkxRA1fOQ8tC56Lm4OOuxAvtP2q/h0mFG6g5FaG
 +yNtijMH0UiW2Dqdvlr0it4WAT+je7x6JwH7E1FzW1OLg3UHZ1dX+lNc2DeSfhx4U6Vq
 e2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+YsaxwbfWVm9IFurTjwCUMxSyQutFwvjtbnnkumX19M=;
 b=fYXzVYB3stNS9wGS7mIuWt2aKHSVoZFagNa72UMWjtE3fI4ogyMAidGdLEBrNfjjzp
 X8oZiHjmiQ6qjo5NW2CQyc5EY/OP3nXdCiNcPT+qUbwZMNw9NX1lro06x33jOMZzAnV3
 5oNiAmKz8r2OG+YX05W4/qWczTSbbyx0EHDrPMfmrbIYCESZyYYlqul+QwO3BH06mztJ
 BbHcJb9ky5UTCnamarlW1FxUJWusop397NKWa5o9bO4xP49lbcSgFe/5aoM0Ucuix8w/
 aVC3aplVGE+gQrI50/t3vIowYL1XtFO4uoHHY0CTBlv0bPVWsdLx/u4ZmAaajgxIpP17
 LHlA==
X-Gm-Message-State: AOAM530cONF3K43EMQrL51vwp5Y1lGyVLeMdut9/B9LOO8XQ7FulaQ5a
 +Maq/pv00qV18kkchKna9xs=
X-Google-Smtp-Source: ABdhPJxe7Y8PEYrteg+lJFZ9ldu33jakNS/cEF4k+L41nnRzTbkCmZk9s7On+r/ByoQGhHJfCXwmNw==
X-Received: by 2002:a63:e40b:: with SMTP id a11mr2913850pgi.450.1601484754295; 
 Wed, 30 Sep 2020 09:52:34 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id x3sm2944015pgg.54.2020.09.30.09.52.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Sep 2020 09:52:33 -0700 (PDT)
Date: Wed, 30 Sep 2020 09:52:31 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH 2/3] usb: host: add uhci compatible support for
 ast2600-uhci
Message-ID: <20200930165230.GB25872@taoren-ubuntu-R90MNF91>
References: <20200930040823.26065-1-ryan_chen@aspeedtech.com>
 <20200930040823.26065-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930040823.26065-3-ryan_chen@aspeedtech.com>
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
Cc: bmc-sw@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Sep 30, 2020 at 12:08:22PM +0800, Ryan Chen wrote:
> Add support for AST2600 SOC UHCI driver.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Tao Ren <rentao.bupt@gmail.com>
