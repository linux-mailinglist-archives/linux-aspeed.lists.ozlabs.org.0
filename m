Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712D6601C05
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Oct 2022 00:04:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mrrcn1vqjz3bn4
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Oct 2022 09:04:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=metafoo.de header.i=@metafoo.de header.a=rsa-sha256 header.s=default2002 header.b=R1QoctUe;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=metafoo.de (client-ip=78.46.137.84; helo=www381.your-server.de; envelope-from=lars@metafoo.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=metafoo.de header.i=@metafoo.de header.a=rsa-sha256 header.s=default2002 header.b=R1QoctUe;
	dkim-atps=neutral
X-Greylist: delayed 1772 seconds by postgrey-1.36 at boromir; Tue, 18 Oct 2022 00:57:29 AEDT
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mrdpx1NLBz3c6M;
	Tue, 18 Oct 2022 00:57:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
	s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=MdtINtRvkg7xkh9fmGLAQq8wLHecOzt4ylQEzbIqL8g=; b=R1QoctUeuHEaXEmVIdYlEBm6bg
	bLePYFMZGzPcEQYYXJFotrqM6WD80+HJdFE6f1/1QMlYS2arHCSlIXh+uAfuNonHVLgmOi3vhUZuB
	jrlfnMU/QtqIqy7HBWoP8fH6fMDsfb8EpSXkH4nhIK451MoqO4/TurP9a29D0WxBXr/6t3B3gjChk
	jew0guT50o7cNZ621x5hWL/vc+lzDEYlVN8iTg3Zx1ZrQOokl03ZJ73Mw4rFNcb2nb1c/QOEF7Yv7
	qroKUdpzHXgcV7CVxslcgKMQB4foKS4dyJ1hjK+phq+AqsO5AjArziYHNVQVkjYJJbxDQwnAtuK6m
	WqfT5wJQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lars@metafoo.de>)
	id 1okPnk-0007DL-6P; Mon, 17 Oct 2022 15:05:04 +0200
Received: from [2001:a61:2a91:5601:9e5c:8eff:fe01:8578]
	by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <lars@metafoo.de>)
	id 1okPnf-000O4x-89; Mon, 17 Oct 2022 15:04:59 +0200
Message-ID: <12fe1b84-1981-bf56-9323-b7f5b698c196@metafoo.de>
Date: Mon, 17 Oct 2022 15:04:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 03/10] net: Replace spi->chip_select references to
 spi->chip_select[0]
Content-Language: en-US
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, broonie@kernel.org,
 sanju.mehta@amd.com, chin-ting_kuo@aspeedtech.com, clg@kaod.org,
 kdasu.kdev@gmail.com, f.fainelli@gmail.com, rjui@broadcom.com,
 sbranden@broadcom.com, eajames@linux.ibm.com, olteanv@gmail.com,
 han.xu@nxp.com, john.garry@huawei.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, narmstrong@baylibre.com, khilman@baylibre.com,
 matthias.bgg@gmail.com, haibo.chen@nxp.com, linus.walleij@linaro.org,
 daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
 agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
 krzysztof.kozlowski@linaro.org, andi@etezian.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, masahisa.kojima@linaro.org, jaswinder.singh@linaro.org,
 rostedt@goodmis.org, mingo@redhat.com, l.stelmach@samsung.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, alex.aring@gmail.com, stefan@datenfreihafen.org,
 kvalo@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, jic23@kernel.org, tudor.ambarus@microchip.com,
 pratyush@kernel.org
References: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
 <20221017121249.19061-4-amit.kumar-mahapatra@amd.com>
From: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <20221017121249.19061-4-amit.kumar-mahapatra@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26692/Mon Oct 17 09:58:17 2022)
X-Mailman-Approved-At: Tue, 18 Oct 2022 09:01:13 +1100
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
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, konrad.dybcio@somainline.org, tali.perry1@gmail.com, ldewangan@nvidia.com, linux-mtd@lists.infradead.org, alim.akhtar@samsung.com, linux-spi@vger.kernel.org, festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, git@amd.com, akumarma@amd.com, linux-samsung-soc@vger.kernel.org, yogeshgaur.83@gmail.com, openbmc@lists.ozlabs.org, jonathanh@nvidia.com, yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-imx@nxp.com, amitrkcian2002@gmail.com, Michael.Hennerich@analog.com, martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org, radu_nicolae.pirea@upb.ro, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, avifishman70@g
 mail.com, venture@google.com, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, michael@walle.cc, thierry.reding@gmail.com, kernel@pengutronix.de, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 10/17/22 14:12, Amit Kumar Mahapatra wrote:
> For adding multi CS support & to prevent any existing driver from
> breaking, replaced all spi->chip_select references to spi->chip_select[0].

But the tree is broken, isn't it? You introduce make chipselect an array 
in one of the earlier patches and then change drivers one by one in 
separate patches.

How about adding a inline helper function spi_chipselect(struct 
spi_device *spi, unsigned int idx). Update all drivers to use that 
function and then once there are no drivers left that directly reference 
the chipselect field you can introduce multi-chipselect support and 
update the helper function.

>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>   drivers/net/ethernet/asix/ax88796c_main.c      | 2 +-
>   drivers/net/ethernet/davicom/dm9051.c          | 2 +-
>   drivers/net/ieee802154/ca8210.c                | 2 +-
>   drivers/net/wan/slic_ds26522.c                 | 2 +-
>   drivers/net/wireless/marvell/libertas/if_spi.c | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/ethernet/asix/ax88796c_main.c b/drivers/net/ethernet/asix/ax88796c_main.c
> index 6ba5b024a7be..65586ff24dfb 100644
> --- a/drivers/net/ethernet/asix/ax88796c_main.c
> +++ b/drivers/net/ethernet/asix/ax88796c_main.c
> @@ -1006,7 +1006,7 @@ static int ax88796c_probe(struct spi_device *spi)
>   	ax_local->mdiobus->parent = &spi->dev;
>   
>   	snprintf(ax_local->mdiobus->id, MII_BUS_ID_SIZE,
> -		 "ax88796c-%s.%u", dev_name(&spi->dev), spi->chip_select);
> +		 "ax88796c-%s.%u", dev_name(&spi->dev), spi->chip_select[0]);
>   
>   	ret = devm_mdiobus_register(&spi->dev, ax_local->mdiobus);
>   	if (ret < 0) {
> diff --git a/drivers/net/ethernet/davicom/dm9051.c b/drivers/net/ethernet/davicom/dm9051.c
> index a523ddda7609..835674ad6ceb 100644
> --- a/drivers/net/ethernet/davicom/dm9051.c
> +++ b/drivers/net/ethernet/davicom/dm9051.c
> @@ -1121,7 +1121,7 @@ static int dm9051_mdio_register(struct board_info *db)
>   	db->mdiobus->phy_mask = (u32)~BIT(1);
>   	db->mdiobus->parent = &spi->dev;
>   	snprintf(db->mdiobus->id, MII_BUS_ID_SIZE,
> -		 "dm9051-%s.%u", dev_name(&spi->dev), spi->chip_select);
> +		 "dm9051-%s.%u", dev_name(&spi->dev), spi->chip_select[0]);
>   
>   	ret = devm_mdiobus_register(&spi->dev, db->mdiobus);
>   	if (ret)
> diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
> index 42c0b451088d..f0ccf1cd79f4 100644
> --- a/drivers/net/ieee802154/ca8210.c
> +++ b/drivers/net/ieee802154/ca8210.c
> @@ -2967,7 +2967,7 @@ static int ca8210_test_interface_init(struct ca8210_priv *priv)
>   		sizeof(node_name),
>   		"ca8210@%d_%d",
>   		priv->spi->master->bus_num,
> -		priv->spi->chip_select
> +		priv->spi->chip_select[0]
>   	);
>   
>   	test->ca8210_dfs_spi_int = debugfs_create_file(
> diff --git a/drivers/net/wan/slic_ds26522.c b/drivers/net/wan/slic_ds26522.c
> index 6063552cea9b..eb053a76fe52 100644
> --- a/drivers/net/wan/slic_ds26522.c
> +++ b/drivers/net/wan/slic_ds26522.c
> @@ -211,7 +211,7 @@ static int slic_ds26522_probe(struct spi_device *spi)
>   
>   	ret = slic_ds26522_init_configure(spi);
>   	if (ret == 0)
> -		pr_info("DS26522 cs%d configured\n", spi->chip_select);
> +		pr_info("DS26522 cs%d configured\n", spi->chip_select[0]);
>   
>   	return ret;
>   }
> diff --git a/drivers/net/wireless/marvell/libertas/if_spi.c b/drivers/net/wireless/marvell/libertas/if_spi.c
> index ff1c7ec8c450..074d6c1f0c2c 100644
> --- a/drivers/net/wireless/marvell/libertas/if_spi.c
> +++ b/drivers/net/wireless/marvell/libertas/if_spi.c
> @@ -1051,7 +1051,7 @@ static int if_spi_init_card(struct if_spi_card *card)
>   				"spi->max_speed_hz=%d\n",
>   				card->card_id, card->card_rev,
>   				card->spi->master->bus_num,
> -				card->spi->chip_select,
> +				card->spi->chip_select[0],
>   				card->spi->max_speed_hz);
>   		err = if_spi_prog_helper_firmware(card, helper);
>   		if (err)


