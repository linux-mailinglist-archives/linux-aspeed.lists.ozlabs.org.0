Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C3E2D0EBB
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Dec 2020 12:14:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqLL82pSxzDqWW
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Dec 2020 22:14:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=CAUu9mk3; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqLKb1Zf7zDqRt
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Dec 2020 22:13:55 +1100 (AEDT)
Received: from zn.tnic (p4fed31e1.dip0.t-ipconnect.de [79.237.49.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 212061EC0426;
 Mon,  7 Dec 2020 12:13:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1607339611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=d35eddzbqWSHez2jV9H7wuGFlrtTbqPqKgMe7Hcvtnc=;
 b=CAUu9mk3JaA3qk7MqKyddXKQhrJ0kjxe5kOQDGbt/vFyrLr0Xett2zUdSvjpixpr3/YOsP
 xHuoiokXsZJGU8uAaCut/tTDDdSoYMw2kFDpoefZffe4EPBRwW3WfizC48NMlcsl0podl/
 AZnNtY/FsUmyCuB5/HCJc5tB7G5e+cE=
Date: Mon, 7 Dec 2020 12:11:16 +0100
From: Borislav Petkov <bp@alien8.de>
To: Troy Lee <troy_lee@aspeedtech.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: edac: aspeed-sdram-edac: Add
 ast2400/ast2600 support
Message-ID: <20201207111116.GB20489@zn.tnic>
References: <20201207090013.14145-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201207090013.14145-1-troy_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tony Luck <tony.luck@intel.com>,
 Robert Richter <rric@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, leetroy@gmail.com,
 Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>,
 Stefan Schaeckeler <sschaeck@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:EDAC-CORE" <linux-edac@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Dec 07, 2020 at 05:00:11PM +0800, Troy Lee wrote:
> Adding Aspeed AST2400 and AST2600 binding for edac driver.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Acked-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/edac/aspeed-sdram-edac.txt       | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

All 3 applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
