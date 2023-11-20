Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE967F2071
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Nov 2023 23:37:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=dg1hNBY0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZ2TC3wRwz30Q4
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Nov 2023 09:37:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=dg1hNBY0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZ2T44sjfz2yMJ;
	Tue, 21 Nov 2023 09:37:44 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2A8FC40E0031;
	Mon, 20 Nov 2023 22:37:40 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Qlr3bOPqbg-W; Mon, 20 Nov 2023 22:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1700519856; bh=x9IsRR5+1IkHxb6g4ZF6VKh5RWuwsZ6e/RDXJfhFiD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dg1hNBY0wesA8gF8gY062vLM00Xkf87s/irWgAp0+1T2yNZoU2eVnkYYyVrxkfpHz
	 v/CDNxZDsCqarhLXL027s+pfyo+cb00NQ+heMcdDK5qHf4eCmwP5AC8Ko4XXrEvh0h
	 qy5WiIgPjMvMtCy9MzPe9CYO9L00hoz00Ae8YDNpQaCpMJbiDtn3ldGtOYWTHCJcOd
	 POUfqOEZmCTk+RCnJetbB71ya+N0vBNuO4UOEIjbyEAX7/qMJhNBUyhUeOKBaWpdr9
	 YXlgbmJesULfeTbywn5O1jZW+CDsSN28Moe7bkZurTMsNjeVqFfIeDunus09ODlB+9
	 fEfyLgKfgFGkHZ6pJpHYRJey0eezKUVcZ8Qc59gKQ92a1zr76WREbMpAypqCcPtj97
	 vg1YoUfOfTbsDQ+D2jCCoGLNi+iEV1PzyzEn3Z73VmCGWfY4BbSsFShjd77tGlbqKQ
	 izFw8wSSMT1BGhfp+Ro1kCZ/D2RdiArgVse5ESOch3H+PRJc2DiRB/eSKimWYc0Imc
	 51ftFCVoExnkhJIHP6oIv23Ozazu8LiNp7aCnA5yDl3BAJl0GeAJMZXNjZcEFeADub
	 rKKadA08E2hrF5E+9USWuVi6IRhECjsE9szf2Lan9eZJvUIChphm7NPyJeVdCD+kcQ
	 vrlIcs/4QTTXJRxGHEKkBd/w=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EC2FE40E01AD;
	Mon, 20 Nov 2023 22:36:56 +0000 (UTC)
Date: Mon, 20 Nov 2023 23:36:51 +0100
From: Borislav Petkov <bp@alien8.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/21] EDAC: Convert to platform remove callback
 returning void
Message-ID: <20231120223651.GIZVvfg1amJyXdmYKQ@fat_crate.local>
References: <20231004131254.2673842-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231004131254.2673842-1-u.kleine-koenig@pengutronix.de>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, linux-aspeed@lists.ozlabs.org, Tali Perry <tali.perry1@gmail.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Khuong Dinh <khuong@os.amperecomputing.com>, Dinh Nguyen <dinguyen@kernel.org>, openbmc@lists.ozlabs.org, Nancy Yuen <yuenn@google.com>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Stanley Chu <yschu@nuvoton.com>, Robert Richter <rric@kernel.org>, Jan Luebbe <jlu@pengutronix.de>, Shravan Kumar Ramani <shravankr@nvidia.com>, Manivannan Sadhasivam <mani@kernel.org>, Andre Przywara <andre.przywara@arm.com>, Johannes Thumshirn <morbidrsa@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, Tero Kristo <kristo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Bjorn Andersson <andersson@kern
 el.org>, linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, James Morse <james.morse@arm.com>, kernel@pengutronix.de, Lei Wang <lewan@microsoft.com>, Stefan Schaeckeler <sschaeck@cisco.com>, Marvin Lin <kflin@nuvoton.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 04, 2023 at 03:12:33PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Uwe Kleine-K=C3=B6nig (21):
>   EDAC/altera: Convert to platform remove callback returning void
>   EDAC/armada_xp: Convert to platform remove callback returning void
>   EDAC/aspeed: Convert to platform remove callback returning void
>   EDAC/bluefield: Convert to platform remove callback returning void
>   EDAC/cell: Convert to platform remove callback returning void
>   EDAC/cpc925: Convert to platform remove callback returning void
>   EDAC/dmc520: Convert to platform remove callback returning void
>   EDAC/highbank_l2: Convert to platform remove callback returning void
>   EDAC/highbank_mc: Convert to platform remove callback returning void
>   EDAC/mpc85xx: Convert to platform remove callback returning void
>   EDAC/npcm: Convert to platform remove callback returning void
>   EDAC/octeon-l2c: Convert to platform remove callback returning void
>   EDAC/octeon-lmc: Convert to platform remove callback returning void
>   EDAC/octeon-pc: Convert to platform remove callback returning void
>   EDAC/octeon-pci: Convert to platform remove callback returning void
>   EDAC/ppc4xx: Convert to platform remove callback returning void
>   EDAC/qcom: Convert to platform remove callback returning void
>   EDAC/synopsys: Convert to platform remove callback returning void
>   EDAC/ti: Convert to platform remove callback returning void
>   EDAC/xgene: Convert to platform remove callback returning void
>   EDAC/zynqmp: Convert to platform remove callback returning void

All applied, thanks.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
