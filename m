Return-Path: <linux-aspeed+bounces-4422-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vkMkERfmTGr8rgEAu9opvQ
	(envelope-from <linux-aspeed+bounces-4422-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 07 Jul 2026 13:42:15 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D4371B0B5
	for <lists+linux-aspeed@lfdr.de>; Tue, 07 Jul 2026 13:42:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=C1SycEyL;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4422-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4422-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gvfTb28Gjz2xKh;
	Tue, 07 Jul 2026 21:42:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783424531;
	cv=none; b=l4jagbPUHbZDS2SxTMG91QXuVIcZIGqNwVf7J2bEAnmPxvr8raFkXm/Lu+OImaPxZ54ZkG/hyALic5Rco+pkJXUHfu1EFgNCF8AQplTgmIPnLPG0cQSDnjJmYvlyrpFu0dvDikwp6x1MH6/wJ8xTCkP6h/61H2oVywL9naKl9M3ELfOAWtW0zMaqDAqSuMHxAWBbJlXyrH4GNYtkxkDKeDM4wu7L+yHwOEeM7JvYX0qVGfTI+sTQzLdC0bBLeAJhzgq95MFV/PDmPhrdOQUs3zQ+MqjyuV0tx4VzRxJsz+tDtER8TJ4joORAWQXbGanfik6NbEV0cZt8+nqoFDJI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783424531; c=relaxed/relaxed;
	bh=vLgY48wjnxI6KTkbs3yoMb3mqAR6cMMCjHviW4AsdM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVRj5OOhW0ooG22CZtb0ec4T00qxbYSZLfggWgg242FUaGt8m3RynsQ3HcDmFOqhfokpZ5snyj/7kggHHQyZZr+BgJyEbpAbg4rQV2fUrFVIHkQEY3s3phjRNrz001+jjulwufX5arGZ8xS8Powzof0lRhmwmz3PQOFkChtWw28FeYjkbRrgrrxy5GQ/wOEJ/f/BMzWJtGxHf0YxXpNrf+2SRvlXktQGMOofkyYNi4VtNpjcC3oJWfD1G9qlU3v97ui1DBHk5yVjRCJwuWrySoUbqdkOPWmuwFmONyrtv60RCUNTW2kiSQxc1NFY57Kulxt7FxG0ZX4UyfjjSoh+rA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C1SycEyL; dkim-atps=neutral; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=liviu.dudau@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gvfTX42CBz2xF8
	for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Jul 2026 21:42:06 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C6E925DD
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Jul 2026 04:41:29 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 711FA3F85F
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Jul 2026 04:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783424493; bh=AXimq/rtIFwP4aD04kh/5vfPSxje93mi8aUhDJB2eB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C1SycEyLqakt++zsO+keWog5o17+WCjcCwlCUfCgZuORwCAiGsOwTk5lyPVuuBEiW
	 jpc+NgHHykO/GaDc8DuzdbKiA9WANRC1WKKf4RBLcAvX1o3iLWSLZdB3dIbqrxqv9D
	 vLEQ1EBmEYTdCbsvnRUdbPJroZydGCzS8+Uq/vME=
Date: Tue, 7 Jul 2026 12:39:54 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Paul Cercueil <paul@crapouillou.net>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eddie James <eajames@linux.ibm.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ge Gordon <gordon.ge@bst.ai>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
	kernel@collabora.com, linux-tegra@vger.kernel.org,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 00/42] of: reserved_mem: Introduce devres helpers and
 convert drivers
Message-ID: <akzliqtjZVwNw594@e142607>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4422-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:paul@crapouillou.net,m:anitha.chrisanthus@intel.com,m:paulk@sys-base.io,m:linusw@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:abrodkin@synopsys.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:michal.simek@amd.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:eajames@linux.ibm.com,m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:minghsiu.tsai@mediatek.com,m:houlong.wei@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kwliu@nuvoton.com,m:kflin@nuvoton.com,m:dmitry.osipenko@collabora.com,m:krzk@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.c
 om,m:srini@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:gordon.ge@bst.ai,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:mathieu.poirier@linaro.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:peter.ujfalusi@linux.intel.com,m:yung-chuan.liao@linux.intel.com,m:daniel.baluta@nxp.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:peter.chen@cixtech.com,m:fugang.duan@cixtech.com,m:ekansh.gupta@oss.qualcomm.com,m:bst-upstream@bstai.top,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:kernel@pengutronix.de,m:kai.vehmanen@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:Vijendar.Mukunda@amd.com,m:zhang.lyra@gmail.com,m:cix-kernel-upstream@cixtech.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.inf
 radead.org,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-media@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:linux-tegra@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:sound-open-firmware@alsa-project.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,crapouillou.net,intel.com,sys-base.io,sholland.org,synopsys.com,ideasonboard.com,amd.com,linux.ibm.com,mediatek.com,collabora.com,nuvoton.com,nvidia.com,arndb.de,linuxfoundation.org,bst.ai,linaro.org,perex.cz,suse.com,nxp.com,pengutronix.de,linux.alibaba.com,cixtech.com,oss.qualcomm.com,bstai.top,linux.dev,vger.kernel.org,lists.freedesktop.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev,alsa-project.org];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER(0.00)[liviu.dudau@arm.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[92];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[e142607:mid,arm.com:from_mime,arm.com:email,arm.com:dkim,lists.ozlabs.org:from_smtp,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94D4371B0B5

On Sat, Jul 04, 2026 at 01:08:13AM +0530, Mukesh Ojha wrote:
> Drivers using of_reserved_mem_device_init() and its variants must
> manually call of_reserved_mem_device_release() in their remove and
> error-unwind paths. This is repetitive boilerplate that is easy to
> get wrong, and several drivers have open-coded the teardown
> inconsistently or skipped it entirely, leading to dangling reserved
> memory references.
> 
> This series introduces devres-managed wrappers —
> devm_of_reserved_mem_device_init(), devm_of_reserved_mem_device_init_by_idx(),
> and devm_of_reserved_mem_device_init_by_name() — that tie the reserved
> memory region lifetime to the device, releasing it automatically on
> unbind. The remaining 40 patches convert drivers across the drm, media,
> ASoC, remoteproc, firmware, mmc, memory and misc subsystems to use these
> helpers, yielding a net reduction of ~90 lines of boilerplate.
> 
> This series depends on  https://lore.kernel.org/lkml/20260703164457.4040457-1-mukesh.ojha@oss.qualcomm.com/
> 
> Konrad Dybcio (1):
>   of: reserved_mem: Introduce devres-managed initialization functions
> 
> Mukesh Ojha (41):
>   of: reserved_mem: Add devm_of_reserved_mem_device_init_by_name()
>   firmware: qcom: scm: Use devm_of_reserved_mem_device_init()
>   remoteproc: da8xx: Use devm_of_reserved_mem_device_init()
>   remoteproc: keystone: Use devm_of_reserved_mem_device_init()
>   media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
>   remoteproc: omap: Use devm_of_reserved_mem_device_init()
>   drm: logicvc: Use devm_of_reserved_mem_device_init()
>   drm: hdlcd: Use devm_of_reserved_mem_device_init()
>   drm: pl111: Use devm_of_reserved_mem_device_init()
>   remoteproc: mtk_scp: Use devm_of_reserved_mem_device_init()
>   media: aspeed: Use devm_of_reserved_mem_device_init()
>   media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
>   memory: tegra210-emc: Use devm_of_reserved_mem_device_init_by_name()
>   drm: komeda: Use devm_of_reserved_mem_device_init()
>   drm: malidp: Use devm_of_reserved_mem_device_init()

For the hdlcd, komeda and malidp drivers:

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>   drm: ingenic: Use devm_of_reserved_mem_device_init()
>   drm: kmb: Use devm_of_reserved_mem_device_init()
>   drm: sun4i: Use devm_of_reserved_mem_device_init()
>   drm: xlnx: zynqmp_dpsub: Use devm_of_reserved_mem_device_init()
>   media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
>   media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
>   mmc: sdhci-of-bst: Use devm_of_reserved_mem_device_init_by_idx()
>   remoteproc: ti_k3: Use devm_of_reserved_mem_device_init()
>   ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
>   ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
>   ASoC: mediatek: mt8183: Use devm_of_reserved_mem_device_init()
>   ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
>   ASoC: SOF: imx: Use devm_of_reserved_mem_device_init_by_name()
>   staging: media: cedrus: Use devm_of_reserved_mem_device_init()
>   ASoC: cix-ipbloq: Use devm_of_reserved_mem_device_init()
>   drm: aspeed: Use devm_of_reserved_mem_device_init()
>   drm: arcpgu: Use devm_of_reserved_mem_device_init()
>   ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
>   ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
>   ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
>   ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
>   ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
>   ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
>   misc: fastrpc: Use devm_of_reserved_mem_device_init()
>   ASoC: fsl: imx-rpmsg: Use devm_of_reserved_mem_device_init_by_idx()
>   ASoC: sprd: Use devm_of_reserved_mem_device_init()
> 
>  drivers/firmware/qcom/qcom_scm.c              | 22 +++------
>  .../gpu/drm/arm/display/komeda/komeda_dev.c   |  4 +-
>  drivers/gpu/drm/arm/hdlcd_drv.c               |  6 +--
>  drivers/gpu/drm/arm/malidp_drv.c              |  4 +-
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     | 13 +-----
>  drivers/gpu/drm/kmb/kmb_drv.c                 | 12 +----
>  drivers/gpu/drm/logicvc/logicvc_drm.c         | 21 ++++-----
>  drivers/gpu/drm/pl111/pl111_drv.c             |  4 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  4 +-
>  drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  4 +-
>  .../platform/arm/mali-c55/mali-c55-core.c     | 12 ++---
>  drivers/media/platform/aspeed/aspeed-video.c  | 12 ++---
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c |  3 +-
>  drivers/media/platform/nuvoton/npcm-video.c   |  9 +---
>  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 16 +------
>  drivers/memory/tegra/tegra210-emc-core.c      | 21 ++++-----
>  drivers/misc/fastrpc.c                        |  2 +-
>  drivers/mmc/host/sdhci-of-bst.c               |  7 +--
>  drivers/of/of_reserved_mem.c                  | 41 +++++++++++++++++
>  drivers/remoteproc/da8xx_remoteproc.c         | 10 +---
>  drivers/remoteproc/keystone_remoteproc.c      | 16 +------
>  drivers/remoteproc/mtk_scp.c                  |  3 +-
>  drivers/remoteproc/omap_remoteproc.c          | 13 +-----
>  drivers/remoteproc/ti_k3_common.c             | 13 +-----
>  drivers/remoteproc/ti_k3_common.h             |  1 -
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    |  6 +--
>  include/linux/of_reserved_mem.h               | 46 +++++++++++++++++++
>  sound/hda/controllers/cix-ipbloq.c            |  2 +-
>  sound/soc/fsl/imx-rpmsg.c                     |  2 +-
>  sound/soc/mediatek/mt8173/mt8173-afe-pcm.c    |  2 +-
>  sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    | 13 +-----
>  sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    |  2 +-
>  sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |  2 +-
>  sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    | 16 +------
>  sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    | 11 +----
>  sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    |  2 +-
>  sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    | 14 +-----
>  sound/soc/sof/imx/imx-common.c                |  9 ++--
>  sound/soc/sof/mediatek/mt8186/mt8186.c        |  2 +-
>  sound/soc/sof/mediatek/mt8195/mt8195.c        |  2 +-
>  sound/soc/sprd/sprd-pcm-dma.c                 |  3 +-
>  43 files changed, 162 insertions(+), 249 deletions(-)
> 
> -- 
> 2.53.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

