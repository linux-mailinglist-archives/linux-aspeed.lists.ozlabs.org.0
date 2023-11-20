Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 413EF7F19DF
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Nov 2023 18:28:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=OWwEBM9P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYvby10jgz3cRp
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Nov 2023 04:28:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=OWwEBM9P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 315 seconds by postgrey-1.37 at boromir; Tue, 21 Nov 2023 04:28:04 AEDT
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYvbm6SRPz3cPR;
	Tue, 21 Nov 2023 04:28:04 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3339640E0031;
	Mon, 20 Nov 2023 17:22:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Giv1lRArfQMf; Mon, 20 Nov 2023 17:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1700500946; bh=T5VVznuzCd2a8UX5KPiD1fC5qSKUkPIUpjwSGVtPbk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWwEBM9PkqTrnSvy4yDjYJ0ZhJryM/rAtmW/2s6oM+uOMLP0V9mr1ejXHu0BEE53e
	 suV84gojqesjvwuhW3/YAOjJ53YgayY1R8mlJZC1Uw34To88V0MHACS8KPGph30ooq
	 eA//+1ShMxFZ7UdW3O+RxL59JN+yv5ZKCJsavenToPhh9ZWGortQGauczkkBwUevb/
	 YNoKrf59reRxf+zjxpMIzTjAbdFEC/l7SGA8Urv7knXFnfoa+8TO+z7WO/HvAW+BMg
	 MtW52+j6bh37JbYXT140+t4iZL0ZYN9pOeqK7CxFotFGUdt+M9IdWM3m3IYkAQp7/d
	 eDKZBwSqtlOwk73mKp+PdthwPavh4ySD60MXTP/3VgPdq5iUCh0BUhIu3BgiefrED7
	 G0tsdv06DhMl1z/ntDDxJubu6smwekD53rIJQpZ1q8eaa4+IYLTQ6fUAGIz9nMGahN
	 Lscr1Nn0M0uV1rdbKoUxb2So+egniBwR42zxfHYPq0WEzGawD7zqygG1oECSILT6OP
	 JHhOLTRu8N+oM9f3FCR1Wbc6z7VzUPSLVsyRQijLtVK0qC3ribaI3rufTRfHVObTiJ
	 pJJND1HyEYqIrI2aK/tFe9D3cFDkIMP/dBZpa4Nb/YPDJ2NvsDW8aKkBTjEVk4/kmU
	 DIUtoZbg/SxzMYPiFqR1xsnc=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BB74940E01A5;
	Mon, 20 Nov 2023 17:21:46 +0000 (UTC)
Date: Mon, 20 Nov 2023 18:21:45 +0100
From: Borislav Petkov <bp@alien8.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/21] EDAC: Convert to platform remove callback
 returning void
Message-ID: <20231120172145.GHZVuVqXpKtX2nbTE4@fat_crate.local>
References: <20231004131254.2673842-1-u.kleine-koenig@pengutronix.de>
 <20231120162054.haryuye4qedlfd7j@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231120162054.haryuye4qedlfd7j@pengutronix.de>
Content-Transfer-Encoding: quoted-printable
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, linux-aspeed@lists.ozlabs.org, Tali Perry <tali.perry1@gmail.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Khuong Dinh <khuong@os.amperecomputing.com>, openbmc@lists.ozlabs.org, Nancy Yuen <yuenn@google.com>, Andy Gross <agross@kernel.org>, Andre Przywara <andre.przywara@arm.com>, Stanley Chu <yschu@nuvoton.com>, Robert Richter <rric@kernel.org>, Jan Luebbe <jlu@pengutronix.de>, Shravan Kumar Ramani <shravankr@nvidia.com>, Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, Johannes Thumshirn <morbidrsa@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, Tero Kristo <kristo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org
 , Ralf Baechle <ralf@linux-mips.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Dinh Nguyen <dinguyen@kernel.org>, James Morse <james.morse@arm.com>, kernel@pengutronix.de, Lei Wang <lewan@microsoft.com>, Stefan Schaeckeler <sschaeck@cisco.com>, Marvin Lin <kflin@nuvoton.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Nov 20, 2023 at 05:20:54PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Any news on this series? Would a resend help?

Nah, lemme have a look.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
