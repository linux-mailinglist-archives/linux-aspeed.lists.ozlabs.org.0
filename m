Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A0B27EFA0
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Sep 2020 18:50:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1j1h5Q6wzDqVv
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Oct 2020 02:50:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bxfX2WXa; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1j1W3mDjzDqTd
 for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Oct 2020 02:50:38 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id u3so97694pjr.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Sep 2020 09:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dKUmQimuyUfWYYZALCDrxF2spAstQLetC2caJRkHLbU=;
 b=bxfX2WXaLI7r3kKW4dqdisvqp0UQJGmnwhZC2f4dkUMbAZklfzVNyDad0QTV6VPtQw
 nkeNCSjihjo+bl3y8ubQQES4iz/ydW6rmWkLmI2us2JcBHKFWPhdMpbVCBLd+bQ+sTGq
 VB085mGZz0psCRnNnxmXepWSlYsOmBhu+Us8E/lI9v4zoYYlG1aX2T1TETopKjiUNUWF
 mg0fnrEfwJcm8p6scbpevS9Nt8EpckVvI9Mid/q0Hgj/5MncLnMMlstnncdcu6oT/qac
 YhGKuDMnNh8AH0MRDUaxqEyhjdJIW0kqgenJvj6Zy55EbI4M1xoorogtN4WbfcuQFG3H
 QiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dKUmQimuyUfWYYZALCDrxF2spAstQLetC2caJRkHLbU=;
 b=BXZQY9BF08fyR7Re4iU50Wkp/IoeAVvp6GJjCw2krr/0h3eFVVzFFaDgVezyVVtyhi
 AnXpZbgzljkzVQtzEmDSyMPDAOkQxDga0zj8b0o44FaHKfIVopbcAEnVigDBLMebonW+
 6PB2ALlzoz5q/xWNUyC4aeV9EWtzCAf0twrv71Z8zWJWEfvLTn/ZOPFWTntuWEh40xn1
 mWlUxwRL/iVFnJQgR0KxeqVjpjnSgPTVtmq0NhRFFHb59NABVVEpdXxocmd9hHHv0fSR
 jbBRro3NY0AOsi/FcXPPHsvA7udEes+1dS29fqtdIAb4cry7gxaBv0xN665++nBrBqR5
 mJ2w==
X-Gm-Message-State: AOAM533wN/fhMxPxBWhaa1n3hoVzuTfl68arI0w7PChKNo/X9/nDPYk+
 LlYUKl5nDZB241shSoaskjw=
X-Google-Smtp-Source: ABdhPJxb5ZsqjleYncIIGOOsfMHsY1UWGm4TiJhG13FTOiOTB6Uwwtchv9dwWXYWqs9FOP7vH9alyA==
X-Received: by 2002:a17:90a:7bcd:: with SMTP id
 d13mr3525260pjl.18.1601484634451; 
 Wed, 30 Sep 2020 09:50:34 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id b11sm2973831pfo.15.2020.09.30.09.50.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Sep 2020 09:50:33 -0700 (PDT)
Date: Wed, 30 Sep 2020 09:50:26 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH 1/3] configs: aspeed: enable UHCI driver in defconfig
Message-ID: <20200930165025.GA25872@taoren-ubuntu-R90MNF91>
References: <20200930040823.26065-1-ryan_chen@aspeedtech.com>
 <20200930040823.26065-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930040823.26065-2-ryan_chen@aspeedtech.com>
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

On Wed, Sep 30, 2020 at 12:08:21PM +0800, Ryan Chen wrote:
> Enable UHCI driver in aspeed_g5_defconfig.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Tao Ren <rentao.bupt@gmail.com>
