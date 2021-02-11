Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E1C318DCF
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Feb 2021 16:05:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dc0Lf0WjdzDwm7
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Feb 2021 02:05:46 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nv4pieaj; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dc0LT65rZzDwm1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Feb 2021 02:05:37 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D96F564F0A;
 Thu, 11 Feb 2021 15:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613055935;
 bh=eMHR2QnFXKhzszOQbr8KEa6+kba6b6+zD2YeMMPU2wU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nv4pieajO7AWDqObBnDXqECPGxxzdiYu2FrFRTEPbeKkyL60as6S/TyPVP9e+onWS
 +vJf72AszBN70JYQKpiuR1FGl3bKXA46Mi6TLLLaktImdEgIl8xhsbQm6GPBeB9bLA
 9r06I4gtNfJoZMVNLwcDnRUESbg6DS1zEf86dqIMM0ZMvgDKboBSZkqTh+OfMc2/sT
 hAeA04h4ovJrGXYxZcmeS9AnnAg+RlVB41g3X1NnpkpePb3/50KXpQTpLngbBJOSJt
 mYaMEcX/+mZkgSm7PxHgwWwW6VWVbQXvSUMZowcUUH8pOuL99kNdynLGstla3S3p+a
 +5t9JE3ZkPCVQ==
From: Arnd Bergmann <arnd@kernel.org>
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>,
 Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.12
Date: Thu, 11 Feb 2021 16:05:30 +0100
Message-Id: <161305590367.259551.3441332889006792758.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8Xf+4VkWC6rkHhsWdwhaLjy2Az=GAHaEe=SvOiUc_OGKSQ@mail.gmail.com>
References: <CACPK8Xf+4VkWC6rkHhsWdwhaLjy2Az=GAHaEe=SvOiUc_OGKSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 10 Feb 2021 12:30:27 +0000, Joel Stanley wrote:
> A small pull request for the aspeed platform this time around.
> 
> The following changes since commit d0e72be77e7995923fac73f27cf7a75d3d1a4dec:
> 
>   soc: aspeed: socinfo: Add new systems (2021-02-10 22:25:45 +1030)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4f79a8b06fccec3dd68935db5a4662435c472abf

       Arnd
